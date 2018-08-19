#!/bin/bash

# We use INTEL compiler. $CC, $CXX, $FC are already set by module
CC=$CC
CXX=$CXX
FC=$FC
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

MYPATH=$(realpath "$0")
source $(dirname "$MYPATH")/env_common.sh
#echo $MPI_INCLUDE_PATH




