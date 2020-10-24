#!/bin/bash

CC=cc
CXX=c++
FC=gfortran
MPICC=mpicc
MPICXX=mpic++
MPIFC=mpif90
MPIFL=mpif90
OMPFLAG=-fopenmp
OMPLINKFLAG=-fopenmp
OMPCXXFLAG=-fopenmp
OMPCCFLAG=-fopenmp
OMPFCFLAG=-fopenmp

source $(dirname $BASH_SOURCE)/env_common.sh
#echo $MPI_INCLUDE_PATH


