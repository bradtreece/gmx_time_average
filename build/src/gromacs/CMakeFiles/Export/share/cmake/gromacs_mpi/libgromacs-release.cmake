#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libgromacs" for configuration "Release"
set_property(TARGET libgromacs APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libgromacs PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/Archival/openmpi/openmpi-3.1.1/install/lib/libmpi.so;dl;rt;m;/usr/lib/x86_64-linux-gnu/libz.so;gmxfftw;-lpthread;-fopenmp"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libgromacs_mpi.so.1.1.0"
  IMPORTED_SONAME_RELEASE "libgromacs_mpi.so.1"
  )

list(APPEND _IMPORT_CHECK_TARGETS libgromacs )
list(APPEND _IMPORT_CHECK_FILES_FOR_libgromacs "${_IMPORT_PREFIX}/lib/libgromacs_mpi.so.1.1.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
