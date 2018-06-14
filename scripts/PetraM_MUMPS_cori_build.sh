#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

MAKE=$(command -v make)
cd $REPO
cp setup_templates/setup_default.py setup.py
touch Makefile.local

export MPICC=cc
export MPICXX=CC
export MPIFC=ftn
export MPIFL=ftn
export CXX=ftn
export LDFLAGS+="-lstdc++"
#note : linker must be fortran since MUMPS need fortran FILE I/O.
#       linkflag must have -pthread, -shared for pytho shared library
#       -lstdc++ is necessary since the wrapper is c++


export USRLOCAL=${TwoPiRoot}
export MUMPS=${TwoPiRoot}/src/MUMPS_5.1.2/
export PORD=${TwoPiRoot}/src/MUMPS_5.1.2/

#MPI
MPI_ROOT=/opt/cray/pe/mpt/7.6.2/gni/mpich-gnu/5.1
export MPICHINCDIR=${MPI_ROOT}/include
export MPICHLNKDIR=${MPI_ROOT}/lib
export MPILIB=
export LAPACK= 
export SCALAPACK=
export BLAS= 

$MAKE
$MAKE install
