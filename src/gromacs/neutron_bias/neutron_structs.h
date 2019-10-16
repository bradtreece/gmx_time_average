#ifndef _neutron_structs_h_
#define _neutron_structs_h_

#include <stdio.h>

#include "gromacs/legacyheaders/types/enums.h"
#include "gromacs/legacyheaders/types/simple.h"
#include "gromacs/swap/enums.h"

#ifdef __cplusplus
extern "C" {
#endif   

typedef struct {
    int            pot_indices[15];
    real            pot_params[3];            /* Brad defined neutron parameters */
    real            pot_scale[2];
    real            exp_dens[10000];
    real            exp_mean[1];
    real            sim_dens[5][10000];
    real            sim_dens_temp[10000];
    real            sim_mean[5];             /* The intent is to have multiple molecules */
    //real            ens_dens[10000];
    //int             num_of_states;
    double          z_bbox;
    double          second_moment;
} t_neutron_input;
#ifdef __cplusplus
}
#endif

#endif //_neutron_structs_h_
