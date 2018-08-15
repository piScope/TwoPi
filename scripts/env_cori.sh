#!/bin/sh

MPICC=cc
MPICXX=CC
MAKEOPT="-j 8"
OMPFLAG="-qopenmp"

MYPATH=$(realpath "$0")
source $(dirname "$MYPATH")/env_common.sh
source $(dirname "$MYPATH")/env_mpi_h.sh
#echo $MPI_INCLUDE_PATH



