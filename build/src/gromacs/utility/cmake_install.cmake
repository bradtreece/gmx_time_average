# Install script for directory: /Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gromacs/utility" TYPE FILE FILES
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/arrayref.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/basedefinitions.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/classhelpers.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/cstringutil.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/datafilefinder.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/errorcodes.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/exceptions.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/fatalerror.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/file.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/flags.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/futil.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/gmxassert.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/init.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/programcontext.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/real.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/smalloc.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/utility/stringutil.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Archival/gromacs/gmx_mpi_ensemble/build/src/gromacs/utility/tests/cmake_install.cmake")

endif()

