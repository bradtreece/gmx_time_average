/*
 * This file is part of the neutron bias package developed for
 * the GROMACS molecular simulation package.
 *
 * Development by Bradley Treece in the Mathias Loesche Lab, 
 * Carnegie Mellon University
 */

#ifndef _update_density_h
#define _update_density_h

#include "gromacs/legacyheaders/sim_util.h"
#include "gromacs/legacyheaders/typedefs.h"
#include "gromacs/legacyheaders/vcm.h"
#include "gromacs/timing/wallcycle.h"

#ifdef __cplusplus
extern "C" {
#endif

struct gmx_signalling_t;

/* Define a number of flags to better control the information
 * passed to compute_globals in md.c and global_stat.
 */

/* We are rerunning the simulation */
#define CGLO_RERUNMD        (1<<1)
/* we are computing the kinetic energy from average velocities */
#define CGLO_EKINAVEVEL     (1<<2)
/* we are removing the center of mass momenta */
#define CGLO_STOPCM         (1<<3)
/* bGStat is defined in do_md */
#define CGLO_GSTAT          (1<<4)
/* Sum the energy terms in global computation */
#define CGLO_ENERGY         (1<<6)
/* Sum the kinetic energy terms in global computation */
#define CGLO_TEMPERATURE    (1<<7)
/* Sum the kinetic energy terms in global computation */
#define CGLO_PRESSURE       (1<<8)
/* Sum the constraint term in global computation */
#define CGLO_CONSTRAINT     (1<<9)
/* Reading ekin from the trajectory */
#define CGLO_READEKIN       (1<<10)
/* we need to reset the ekin rescaling factor here */
#define CGLO_SCALEEKIN      (1<<11)


//Brad
void BRAD_global_stat(gmx_global_stat_t gs, t_commrec *cr,
                 t_inputrec *inputrec, t_state *state_local,
                 t_mdatoms *mdatoms, t_state *state_global);

void BRAD_compute_globals(gmx_global_stat_t gstat, t_commrec *cr, t_inputrec *ir,
                     t_state *state, t_state *state_global, t_mdatoms *mdatoms,
                     gmx_wallcycle_t wcycle, gmx_signalling_t *gs, gmx_bool bInterSimGS);

//Brad

#ifdef __cplusplus
}
#endif

#endif  /* _update_density_h */
