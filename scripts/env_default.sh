#!/bin/sh

source $(dirname "$MYPATH")/env_common.sh

CC=cc
CXX=c++
FC=gfortran
MPICC=mpicc
MPICXX=mpicxx
MPIFC=mpif90
MPIFL=mpif90
MAKEOPT=""
OMPFLAG="-fopenmp""

MYPATH=$(realpath "$0")
source $(dirname "$MYPATH")/env_mpi_h.sh
#echo $MPI_INCLUDE_PATH


