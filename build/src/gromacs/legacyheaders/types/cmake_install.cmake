# Install script for directory: /Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gromacs/legacyheaders/types" TYPE FILE FILES
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/commrec_fwd.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/constr.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/energy.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/enums.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/fcdata.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/force_flags.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/forcerec.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/genborn.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/group.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/hw_info.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/ifunc.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/inputrec.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/interaction_const.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/mdatom.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/membedt.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/nblist.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/nrnb.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/ns.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/nsgrid.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/oenv.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/qmmmrec.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/rgb.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/shellfc.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/simple.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/legacyheaders/types/state.h"
    )
endif()

