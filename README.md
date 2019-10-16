# gmx_time_average
Instructions for installation on the loesche machine:

- sets environment variables for mpi
$ export PATH=$PATH:/Archival/openmpi/openmpi-3.1.1/install/bin/
$ export PATH=$PATH:/Archival/openmpi/openmpi-3.1.1/install/bin/

- navigate to the gromacs directory and create a build directory
$ mkdir build
$ cd build

- make the executables but do not actually install. if that is desired, read the gromacs documentation
$ cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DGMX_MPI=ON -DGMX_GPU=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=/Archival/gromacs/install/
$ make -j 8

- the executable can be found in "gromacs install director"/build/bin/gmx_mpi
