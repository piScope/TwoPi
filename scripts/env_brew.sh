#!/bin/sh

CC=gcc-8
CXX=g++-8
FC=gfortran
MPICC=mpicc
MPICXX=mpic++
MPIFC=mpif90
MPIFL=mpif90
MAKEOPT="-j 4"
OMPFLAG="-fopenmp"  # -fopenmp (gcc/clang) -qopenmp (intel)
OMPFLAG=-fopenmp
OMPLINKFLAG=-fopenmp
OMPCXXFLAG=-fopenmp
OMPCCFLAG=-fopenmp
OMPFCFLAG=-fopenmp

echo "$0" $0
MYPATH=$(realpath "$0")
source $(dirname "$MYPATH")/env_common.sh
