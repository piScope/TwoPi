#!/bin/bash

MPICC=cc
MPICXX=CC
MAKEOPT="-j 8"
OMPFLAG="-qopenmp"
OMPLINKFLAG=-qopenmp
OMPCXXFLAG=-qopenmp
OMPCCFLAG=-qopenmp
OMPFCFLAG=-qopenmp

MYPATH=$(realpath "$0")
source $(dirname "$MYPATH")/env_common.sh
#echo $MPI_INCLUDE_PATH



