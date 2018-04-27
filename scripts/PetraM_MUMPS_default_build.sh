#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

MAKE=$(command -v make)
cd $REPO
cp setup_templates/setup_default.py setup.py
touch Makefile.local

export MPICC=mpicc
export MPICXX=mpicxx
export MPIFC=mpifort
export MPIFL=mpifort
export CXX=gfortran
export LDFLAGS+="-lstdc++"
#note : linker must be fortran since MUMPS need fortran FILE I/O.
#       linkflag must have -pthread, -shared for pytho shared library
#       -lstdc++ is necessary since the wrapper is c++


export USRLOCAL=${TwoPiRoot}
export MUMPS=${TwoPiRoot}/src/MUMPS_5.1.2/
export PORD=${TwoPiRoot}/src/MUMPS_5.1.2/

#MPI
export MPICHINCDIR="/usr/local/include"
export MPICHLNKDIR="/usr/local/lib"

$MAKE
$MAKE install
