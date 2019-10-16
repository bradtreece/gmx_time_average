/*
 */

#include <cmath>//Brad
#include <stdio.h>
#include <string.h>

#include "gmxpre.h"

#include "gromacs/legacyheaders/md_support.h"

#include <algorithm>

#include "gromacs/domdec/domdec.h"
#include "gromacs/legacyheaders/macros.h"
#include "gromacs/legacyheaders/md_logging.h"
#include "gromacs/legacyheaders/mdrun.h"
#include "gromacs/legacyheaders/names.h"
#include "gromacs/legacyheaders/nrnb.h"
#include "gromacs/legacyheaders/rbin.h"
#include "gromacs/legacyheaders/typedefs.h"
#include "gromacs/legacyheaders/vcm.h"
#include "gromacs/legacyheaders/types/commrec.h"
#include "gromacs/math/vec.h"
#include "gromacs/mdlib/mdrun_signalling.h"
#include "gromacs/timing/wallcycle.h"
#include "gromacs/topology/mtop_util.h"
#include "gromacs/utility/arrayref.h"
#include "gromacs/utility/cstringutil.h"
#include "gromacs/utility/smalloc.h"
#include "gromacs/utility/snprintf.h"
#include "gromacs/neutron_bias/preprocess_configuration.h"

enum neutron_data_flags {
    eScaling,
    eIndices,
    ePotential_Parameters,
    eDensity,
    eRadii,
    eError
};

neutron_data_flags which_neutron_flag(const char *indicator)
{
    if (strcmp(indicator, "u")==0) return eScaling;
    if (strcmp(indicator, "n")==0) return eIndices;
    if (strcmp(indicator, "p")==0) return ePotential_Parameters;
    if (strcmp(indicator, "d")==0) return eDensity;
    if (strcmp(indicator, "r")==0) return eRadii;
    else return eError;
}

void Read_Neutron_Input(const char *filename, t_neutron_input *neu_inp)
{
    /*---------------------------------------------------------------*/
    FILE *stream;
    stream = fopen(filename, "r");

    int line_len = 100000;
    char temp_str[line_len];//This is bad if the data is very long
    char radii_str[line_len];
    
    char indicator[1];
    int indices[2];
    double grid_params[3];
    float flt_tmp;
    int str_offset;
    int cnt;
    int num_points = 0;
    int n_atoms = 0;
    double shape_pot_scale = 1.0;
    double offset_pot_scale = 1.0;
    int index_pairs = 1;
    bool bNegative_Density = false;
    bool bRadii = false;
    real sum = 0.0;
    /*---------------------------------------------------------------*/

    /*--------------------------------------------------------------------------------------------------------------------------------------*/
    while (fgets(temp_str, line_len, stream)!= NULL)
    {
        // check the first character for the flags (u,n,p,d,r).
        sscanf(temp_str, "%s", indicator);

        switch (which_neutron_flag(indicator))
        {
            case eScaling: // Deal with the scaling of the different parts of the potential
	        sscanf(temp_str, "%s%lf%lf", indicator, &shape_pot_scale, &offset_pot_scale);

	        (neu_inp->pot_scale)[0] = shape_pot_scale;
	        (neu_inp->pot_scale)[1] = offset_pot_scale;

	        fprintf(stderr, "\n\nThe scaling factor for the shape potential is %.3g kJ-nm/mol || %.3g kT-nm @ 300K.\n",
			        shape_pot_scale, 0.4*shape_pot_scale);
	        fprintf(stderr, "\nThe spring constant for the offset potential is %.3g kJ/mol-nm^2 || %.3g kT/nm^2 @ 300K.\n",
			        offset_pot_scale, 0.4*offset_pot_scale);
                
		break;

            case eIndices: // Deal with the indices of the atoms to be forced. Multiple calls increment the number of index pairs in the array
                sscanf(temp_str, "%s%i%i", indicator, &indices[0], &indices[1]);
		(neu_inp->pot_indices)[2*index_pairs - 1] = indices[0];
		(neu_inp->pot_indices)[2*index_pairs]     = indices[1];
		index_pairs += 1;

		fprintf(stderr, "\n%i atom sets have been processed.\n", index_pairs-1);
	        if (index_pairs > 6) fprintf(stderr, "\nTOO MANY ATOM SETS HAVE BEEN ENTERED, 5 is the current limit.\n");
		
		break;

            case ePotential_Parameters: // Deal with the density array z-axis specification
                sscanf(temp_str, "%s%lf%lf%lf", indicator, &grid_params[0], &grid_params[1], &grid_params[2]);
		(neu_inp->pot_params)[0] = grid_params[0];
		(neu_inp->pot_params)[1] = grid_params[1];
		(neu_inp->pot_params)[2] = grid_params[2];

		num_points = round( (grid_params[1]-grid_params[0])/grid_params[2] + 1);
		fprintf(stderr, "\nThe number of potential runs from %.5gnm to %.5gnm in %.5gnm steps.\n", grid_params[0], grid_params[1], grid_params[2]);
		fprintf(stderr, "\nThe number of points in the density array from the parameter specifications is %i.\n", num_points);

	        break;

	    case eDensity:
		bNegative_Density = false;
		// First value is the flag. Needs to be disregarded.
		// %n records the number of bytes so that the string can be shifted to read the next value.
                sscanf(temp_str, "%s%n", indicator, &str_offset);
		// Copy 'length - offset' worth of bytes from 'string start + offset' to 'string start' 
                memmove(temp_str, temp_str+str_offset, line_len-str_offset);
		// Set 'zeros' for the values from 'string start + length - offset' for next 'offset' bytes
		memset(temp_str+line_len-str_offset, '-', str_offset);
                
		cnt = 0;
                while ( sscanf(temp_str, "%f%n", &flt_tmp, &str_offset)>0 ) {
                    (neu_inp->exp_dens)[cnt] = flt_tmp;
                    cnt+=1;
                    if (flt_tmp < 0) bNegative_Density = true; // Bad density entry

		    // Move on to the next
                    memmove(temp_str, temp_str+str_offset,line_len-str_offset);
                    memset(temp_str+line_len-str_offset,'-',str_offset);
                }
		if (bNegative_Density) {
                    fprintf(stderr,"\n\n\nCRITICAL ERROR: Densities less than zero encountered! Density should be greater than or equal to zero. Please make and adjustment!\n\n\n");
                }

                fprintf(stderr,"\nThe number of points from reading the experimental density is %i.\n",cnt);
                if (cnt != num_points) {
                    fprintf(stderr,"\n\n\nERROR: The number of points in the density do not match the parameter specification for the density, please make an adjustment.\n");
                }

	        break;
            
            case eRadii:
		bRadii = true;
                // Remove the indicator at the front
		sscanf(temp_str, "%s%n", indicator, &str_offset);
                memmove(temp_str, temp_str+str_offset, line_len-str_offset);
		memset(temp_str+line_len-str_offset, '-', str_offset);
		// Save for later
		strcpy(radii_str, temp_str);

                break;

	    default:
		fprintf(stderr, "\nAn unexpected flag was found at the start of a line: %s\n", indicator);
	        break;
	}
    }
    (neu_inp->pot_indices)[0] = index_pairs-1;
    fprintf(stderr,"\n- Brad\n\n");
    /*--------------------------------------------------------------------------------------------------------------------------------------*/

    /*---------------------------------------------------------------------------------------------------------*/
    // Radii for Gaussian densities per atom
    n_atoms = (neu_inp->pot_indices)[2] - (neu_inp->pot_indices)[1] + 1;
    snew(neu_inp->radii, n_atoms);
    if (bRadii) {
        for (cnt = 0; cnt < n_atoms; cnt++)
	{
            sscanf(temp_str, "%f%n", &flt_tmp, &str_offset);
            (neu_inp->radii)[cnt] = flt_tmp;
            cnt+=1;
            // Move on to the next
            memmove(temp_str, temp_str+str_offset,line_len-str_offset);
            memset(temp_str+line_len-str_offset,'-',str_offset);
        }
    } else {
        for (cnt = 0; cnt < n_atoms; cnt++)
	{ (neu_inp->radii)[cnt] = 0.1; } // Default is 0.1nm = 1A
	
    }

    // First Moment of the experimental density
    sum = 0.0;
    for (cnt = 0; cnt < num_points; cnt++)
    { sum += grid_params[2]*(grid_params[0] + cnt*grid_params[2])*(neu_inp->exp_dens)[cnt]; }
    (neu_inp->exp_mean)[0] = sum;

    // Initialize the simulation densities and simulation first moments
    for (int cnt2 = 0; cnt2<5; cnt2++)
    {
        for (cnt = 0; cnt < 10000; cnt++)
	{ (neu_inp->sim_dens)[cnt2][cnt] = 0.0; }
	(neu_inp->sim_mean)[cnt2] = 0.0;
    }
    (neu_inp->z_bbox) = 0.0; // Periodic box z-dimension

    // Second Moment of the experimental density
    sum = 0.0;
    for (cnt = 0; cnt < num_points; cnt++)
    { sum += grid_params[2] * (neu_inp->exp_dens)[cnt] * pow( (grid_params[0] + cnt*grid_params[2] - (neu_inp->exp_mean)[0]), 2.0); }
    (neu_inp->second_moment) = pow(sum, 0.5);
    /*---------------------------------------------------------------------------------------------------------*/
}
//Brad
