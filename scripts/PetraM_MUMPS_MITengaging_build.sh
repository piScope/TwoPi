#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

MAKE=$(command -v make)
cd $REPO
cp setup_templates/setup_default.py setup.py
touch Makefile.local

export MPICC=mpiicc
export MPICXX=mpiicpc
export MPIFC=mpiifort
export MPIFL=mpiifort
export CXX=mpiifort
export LDFLAGS+="-lstdc++"
#note : linker must be fortran since MUMPS need fortran FILE I/O.
#       linkflag must have -pthread, -shared for pytho shared library
#       -lstdc++ is necessary since the wrapper is c++

export USRLOCAL=${TwoPiRoot}
export MUMPS=${TwoPiRoot}/src/MUMPS_5.1.2/
export PORD=${TwoPiRoot}/src/MUMPS_5.1.2/
export SCALAPACK=""
export LAPACK=""
export BLAS=""
export SCOTCH=""
#MPI
export MPICHINCDIR="/home/software/intel/2017-01/compilers_and_libraries_2017.1.132/linux/mpi/intel64/include"
export MPICHLNKDIR="/home/software/intel/2017-01/compilers_and_libraries_2017.1.132/linux/mpi/intel64/lib"

export MKL="-mkl=cluster"

$MAKE
$MAKE install

