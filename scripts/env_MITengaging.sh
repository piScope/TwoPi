#!/bin/bash

# We use INTEL compiler. $CC, $CXX, $FC are already set by module
CC=icc
CXX=icpc
FC=ifort
MPICC=mpiicc
MPICXX=mpiicpc
MPIFC=mpiifort
MPIFL=mpiifort
MAKEOPT="-j 16"
OMPFLAG="-qopenmp"
OMPLINKFLAG=-qopenmp
OMPCXXFLAG=-qopenmp
OMPCCFLAG=-qopenmp
OMPFCFLAG=-qopenmp

source $(dirname $BASH_SOURCE)/env_common.sh
#echo $MPI_INCLUDE_PATH




