# Install script for directory: /Archival/gromacs/gmx_mpi_ensemble/src/gromacs/analysisdata

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gromacs/analysisdata" TYPE FILE FILES
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/analysisdata/abstractdata.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/analysisdata/analysisdata.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/analysisdata/arraydata.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/analysisdata/dataframe.h"
    "/Archival/gromacs/gmx_mpi_ensemble/src/gromacs/analysisdata/datamodule.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Archival/gromacs/gmx_mpi_ensemble/build/src/gromacs/analysisdata/modules/cmake_install.cmake")
  include("/Archival/gromacs/gmx_mpi_ensemble/build/src/gromacs/analysisdata/tests/cmake_install.cmake")

endif()

