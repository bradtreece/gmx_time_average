/*
 */

#include <cmath>//Brad
#include <stdio.h>

#include "gromacs/neutron_bias/update_density.h"//Brad

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

typedef struct gmx_global_stat
{
    t_bin *rb;
    int   *itc0;
    int   *itc1;
} t_gmx_global_stat;

//Brad
//
void BRAD_global_stat(gmx_global_stat_t gs, t_commrec *cr,
                 t_inputrec *inputrec, t_state *state_local,
		 t_mdatoms *mdatoms, t_state *state_global)
{
    t_bin *rb;
    rb   = gs->rb;

    int isim_dens_temp = 0;
    int homenr    = mdatoms->homenr;
    int i=0, j=0;

    // This routine copies all the data to be summed into one big buffer
    // using the t_bin struct.

    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
    // This protocol needs modified //
    //    to loop over molecules    //
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//

    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
    // Calculate the local density //
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//

    // Obtain the global density parameters (nm)
    double zmin   = (inputrec->neu_inp->pot_params)[0];
    double zstep  = (inputrec->neu_inp->pot_params)[2];
    double z_bbox = (state_local->box)[2][2];
    double second_moment = (inputrec->neu_inp->second_moment);
    double z, nrm, sum, sigma;
    int    z_low = 0, z_hi = 0;
    int    ndx_l, ndx_h, ii, glob_ndx;

    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
    // Update z-vector for bounding box // 
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//

    (inputrec->neu_inp->z_bbox) = z_bbox;

    /* Loop over all pairs of indices:
       indices[0] is the number of molecules being forced.
       After indices[0], there are that many pairs of integers in 'indices' containing the start 
       and stop index in the .gro (or global index+1) for each molecule        */
    for (ii = 0;ii < (int) (inputrec->neu_inp->pot_indices)[0];ii++)
    {
	//printf("\n\n\nloop=%i,node=%i\n\n\n", ii, cr->nodeid);
        ndx_l = (inputrec->neu_inp->pot_indices)[2*ii+1] - 1; // Set the bounds of global index for forced atoms
        ndx_h = (inputrec->neu_inp->pot_indices)[2*ii+2] - 1;
        // # of atoms * integral of single gaussian without the variance
	// This gives a unit area for full profile after norm
        nrm   = (ndx_h-ndx_l+1)*pow(2.0*M_PI,0.5);


        // Intialize the density variable
        for (i=0; i<10000; i++)
        {
            (inputrec->neu_inp->sim_dens_temp)[i] = 0.0;
        }

        // Add up contributions
        for (i=0; i<homenr; i++)
        {
	    glob_ndx = cr->dd->gatindex[i];
            if ((glob_ndx >= ndx_l)&&(glob_ndx <= ndx_h))
            {
                z = (state_local->x)[i][2];
		// The radius supplied (or default 0.1nm) determines the sigma for the Gaussian
		sigma = (inputrec->neu_inp->radii)[glob_ndx-ndx_l];
                // If the z-value is smaller than the minimum in the potential, add the z-value of the bounding box 
                //     otherwise, the index for the array could compute to be negative. Only works for rectangular pbc.
                if (z<zmin)
                {
                    z += z_bbox;
                }
		// The contribution comes from z +/- 3 sigma
                z_low = floor( ( z-3*sigma - zmin ) / zstep );
                z_hi  = floor( ( z+3*sigma - zmin ) / zstep );

                for(j=z_low;(j<z_hi);j++) // Add in all the contribuitons to the density between +/- 3 sigma
                {
                    (inputrec->neu_inp->sim_dens_temp)[j] += exp( -0.5*pow( z-(zmin + zstep*j) ,2)/(sigma*sigma) )/(nrm*sigma);
                }
            }
        }

        //%%%%%%%%%%%%%%%%%%%%//
        // Sum over the nodes //
        //%%%%%%%%%%%%%%%%%%%%//

        isim_dens_temp = add_binr(rb, 10000, inputrec->neu_inp->sim_dens_temp);
        where();

        sum_bin(rb, cr);
        where();

        extract_binr(rb, isim_dens_temp, 10000, inputrec->neu_inp->sim_dens_temp);
        where();

        //%%%%%%%%%%%%%%%%%%%%//
        // Calculate the mean //
        //%%%%%%%%%%%%%%%%%%%%//
    
        sum = 0.0;
        for (i=0;i<10000;i++)
        {
            z = zmin + zstep*i;
            sum += zstep*z*(inputrec->neu_inp->sim_dens_temp)[i];
        }
        (inputrec->neu_inp->sim_mean)[ii] = sum;

        //%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
        // Set The Simulation Density //
        //%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
        
        // If the offset < the width of the profile, update the ensemble
        if ( std::abs( (inputrec->neu_inp->sim_mean)[ii] - (inputrec->neu_inp->exp_mean)[0] ) < second_moment)
	//if (0.0 == 0.0)
        {
            for (i=0; i<10000; i++)
            {
                (state_global->ens_dens)[i] = ((state_global->num_of_states)*(state_global->ens_dens)[i] + (inputrec->neu_inp->sim_dens_temp)[i]) / ((state_global->num_of_states) + 1);
                (inputrec->neu_inp->sim_dens)[ii][i] = (state_global->ens_dens)[i];
            }
	    (state_global->num_of_states) += 1;
	    (state_local->num_of_states)  += 1;
        }
        else
        {
            for (i=0; i<10000; i++)
            {
                (inputrec->neu_inp->sim_dens)[ii][i] = (inputrec->neu_inp->sim_dens_temp)[i];
            }
        }
    }
}

void BRAD_compute_globals(gmx_global_stat_t gstat, t_commrec *cr, t_inputrec *ir, t_state *state,
	             t_state *state_global, t_mdatoms *mdatoms, gmx_wallcycle_t wcycle,
                     struct gmx_signalling_t *gs, gmx_bool bInterSimGS)
{

    //gmx::ArrayRef<real> signalBuffer = prepareSignalBuffer(gs);
    if (PAR(cr))
    {
        wallcycle_start(wcycle, ewcMoveE);
        BRAD_global_stat(gstat, cr, ir, state, mdatoms, state_global);
        wallcycle_stop(wcycle, ewcMoveE);
    }
    handleSignals(gs, cr, bInterSimGS);

}
//Brad
