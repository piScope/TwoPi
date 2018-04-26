#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

MAKE=$(command -v make)
cd $REPO
touch Makefile.local

export MPICC=mpiicc
export MPICXX=mpiicpc
export MPIFC=mpiifort
export MPIFL=mpiifort

export USRLOCAL=${TwoPiRoot}
export MUMPS=${TwoPiRoot}/src/MUMPS_5.1.2/
export PORD=${TwoPiRoot}/src/MUMPS_5.1.2/

#MPI
export MPICHINCDIR="/home/software/intel/2017-01/compilers_and_libraries_2017.1.132/linux/mpi/intel64/include"
export MPICHLNKDIR="/home/software/intel/2017-01/compilers_and_libraries_2017.1.132/linux/mpi/intel64/lib"

export MKL="-mkl=cluster"

$(MAKE)
$(MAKE) install

