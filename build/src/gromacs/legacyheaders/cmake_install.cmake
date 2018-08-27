# Install script for directory: /Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Archival/gromacs/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gromacs/legacyheaders" TYPE FILE FILES
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/calcgrid.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/calcmu.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/chargegroup.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/checkpoint.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/constr.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/copyrite.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/disre.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/ebin.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/force.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/genborn.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/gmx_cpuid.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/gmx_detect_hardware.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/gmx_omp_nthreads.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/gmx_thread_affinity.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/inputrec.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/macros.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/main.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/md_logging.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/md_support.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/mdatoms.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/mdebin.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/mdrun.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/names.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/network.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/nonbonded.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/nrnb.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/ns.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/nsgrid.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/oenv.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/orires.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/perf_est.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/qmmm.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/rbin.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/readinp.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/shellfc.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/sighandler.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/sim_util.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/splitter.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/tables.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/tgroup.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/txtdump.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/typedefs.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/update.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/vcm.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/viewit.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/vsite.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/warninp.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Archival/gromacs/gmx_mpi_ensemble/build/src/gromacs/legacyheaders/types/cmake_install.cmake")

endif()

