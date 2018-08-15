#!/bin/sh


MPICC=mpicc
MPICXX=mpicxx
MAKEOPT="-j 4"
OMPFLAG="-fopenmp"  # -fopenmp (gcc/clang) -qopenmp (intel)

MYPATH=$(realpath "$0")
source $(dirname "$MYPATH")/env_common.sh
source $(dirname "$MYPATH")/env_mpi_h.sh
