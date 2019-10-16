/*
 * This file is part of the neutron bias package developed for
 * the GROMACS molecular simulation package.
 *
 * Development by Bradley Treece in the Mathias Loesche Lab, 
 * Carnegie Mellon University
 */

#ifndef _preprocess_configuration_h
#define _preprocess_configuration_h

#include "gromacs/legacyheaders/sim_util.h"
#include "gromacs/legacyheaders/typedefs.h"
#include "gromacs/legacyheaders/vcm.h"
#include "gromacs/timing/wallcycle.h"
#include "gromacs/neutron_bias/neutron_structs.h"

#ifdef __cplusplus
extern "C" {
#endif

void Read_Neutron_Input(const char *filename, t_neutron_input *neu_inp);

#ifdef __cplusplus
}
#endif

#endif  /* _update_density_h */

