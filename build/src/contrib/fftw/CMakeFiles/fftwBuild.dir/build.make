# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Archival/gromacs/gmx_mpi_ensemble

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Archival/gromacs/gmx_mpi_ensemble/build

# Utility rule file for fftwBuild.

# Include the progress variables for this target.
include src/contrib/fftw/CMakeFiles/fftwBuild.dir/progress.make

src/contrib/fftw/CMakeFiles/fftwBuild: src/contrib/fftw/CMakeFiles/fftwBuild-complete


src/contrib/fftw/CMakeFiles/fftwBuild-complete: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-install
src/contrib/fftw/CMakeFiles/fftwBuild-complete: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-mkdir
src/contrib/fftw/CMakeFiles/fftwBuild-complete: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-download
src/contrib/fftw/CMakeFiles/fftwBuild-complete: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-update
src/contrib/fftw/CMakeFiles/fftwBuild-complete: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-patch
src/contrib/fftw/CMakeFiles/fftwBuild-complete: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-configure
src/contrib/fftw/CMakeFiles/fftwBuild-complete: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-build
src/contrib/fftw/CMakeFiles/fftwBuild-complete: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-install
src/contrib/fftw/CMakeFiles/fftwBuild-complete: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-pre-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Archival/gromacs/gmx_mpi_ensemble/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'fftwBuild'"
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E make_directory /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/CMakeFiles
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E touch /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/CMakeFiles/fftwBuild-complete
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E touch /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-done

src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-install: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Archival/gromacs/gmx_mpi_ensemble/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing install step for 'fftwBuild'"
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-build && $(MAKE) install
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-build && /usr/bin/cmake -E touch /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-install

src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Archival/gromacs/gmx_mpi_ensemble/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'fftwBuild'"
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E make_directory /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E make_directory /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-build
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E make_directory /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E make_directory /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/tmp
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E make_directory /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E make_directory /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E touch /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-mkdir

src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-download: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-urlinfo.txt
src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-download: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-mkdir
src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-download: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-pre-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Archival/gromacs/gmx_mpi_ensemble/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (verify and extract) for 'fftwBuild'"
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src && /usr/bin/cmake -P /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/verify-fftwBuild.cmake
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src && /usr/bin/cmake -P /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/extract-fftwBuild.cmake
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src && /usr/bin/cmake -E touch /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-download

src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-update: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Archival/gromacs/gmx_mpi_ensemble/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'fftwBuild'"
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E echo_append
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E touch /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-update

src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-patch: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Archival/gromacs/gmx_mpi_ensemble/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'fftwBuild'"
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E echo_append
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E touch /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-patch

src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-configure: src/contrib/fftw/fftwBuild-prefix/tmp/fftwBuild-cfgcmd.txt
src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-configure: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-update
src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-configure: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Archival/gromacs/gmx_mpi_ensemble/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'fftwBuild'"
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-build && /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild/configure --prefix=/Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix --libdir=/Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/lib --disable-fortran --disable-shared --enable-static --with-pic --enable-sse2 --enable-avx --enable-float
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-build && /usr/bin/cmake -E touch /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-configure

src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-build: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Archival/gromacs/gmx_mpi_ensemble/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'fftwBuild'"
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-build && $(MAKE)
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-build && /usr/bin/cmake -E touch /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-build

src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-pre-download:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Archival/gromacs/gmx_mpi_ensemble/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Performing pre-download step for 'fftwBuild'"
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -P /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftw-download.cmake
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && /usr/bin/cmake -E touch /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-pre-download

fftwBuild: src/contrib/fftw/CMakeFiles/fftwBuild
fftwBuild: src/contrib/fftw/CMakeFiles/fftwBuild-complete
fftwBuild: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-install
fftwBuild: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-mkdir
fftwBuild: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-download
fftwBuild: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-update
fftwBuild: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-patch
fftwBuild: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-configure
fftwBuild: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-build
fftwBuild: src/contrib/fftw/fftwBuild-prefix/src/fftwBuild-stamp/fftwBuild-pre-download
fftwBuild: src/contrib/fftw/CMakeFiles/fftwBuild.dir/build.make

.PHONY : fftwBuild

# Rule to build all files generated by this target.
src/contrib/fftw/CMakeFiles/fftwBuild.dir/build: fftwBuild

.PHONY : src/contrib/fftw/CMakeFiles/fftwBuild.dir/build

src/contrib/fftw/CMakeFiles/fftwBuild.dir/clean:
	cd /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw && $(CMAKE_COMMAND) -P CMakeFiles/fftwBuild.dir/cmake_clean.cmake
.PHONY : src/contrib/fftw/CMakeFiles/fftwBuild.dir/clean

src/contrib/fftw/CMakeFiles/fftwBuild.dir/depend:
	cd /Archival/gromacs/gmx_mpi_ensemble/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Archival/gromacs/gmx_mpi_ensemble /Archival/gromacs/gmx_mpi_ensemble/src/contrib/fftw /Archival/gromacs/gmx_mpi_ensemble/build /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw /Archival/gromacs/gmx_mpi_ensemble/build/src/contrib/fftw/CMakeFiles/fftwBuild.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/contrib/fftw/CMakeFiles/fftwBuild.dir/depend

