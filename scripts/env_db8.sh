#!/bin/bash
CC=cc
CXX=c++
FC=gfortran
MPICC=mpicc
MPICXX=mpicxx
MPIFC=mpif90
MPIFL=mpif90
OMPFLAG="-fopenmp"
OMPLINKFLAG=-fopenmp
OMPCXXFLAG=-fopenmp
OMPCCFLAG=-fopenmp
OMPFCFLAG=-fopenmp

# if you want to specify this directly instead of having CMAKE to find...
MPI_INCLUDE_PATH=/usr/lib/openmpi/include
MPI_LIBRARY_PATH=/usr/lib/openmpi/lib

# if you want to specify Boost instead of having CMAKE to find...
#BOOST_INCLUDE_PATH=/usr/local/inclue
#BOOST_LIBRARY_PATH=/usr/local/lib

source $(dirname $BASH_SOURCE)/env_common.sh
#echo $MPI_INCLUDE_PATH


