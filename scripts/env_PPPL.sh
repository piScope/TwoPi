#!/bin/bash
CC=icc
CXX=icpc
FC=ifort
MPICC=mpicc
MPICXX=mpicxx
MPIFC=mpif90
MPIFL=mpif90
MAKEOPT="-j 8"
OMPFLAG="-qopenmp"
OMPLINKFLAG=-qopenmp
OMPCXXFLAG=-qopenmp
OMPCCFLAG=-qopenmp
OMPFCFLAG=-qopenmp

source $(dirname $BASH_SOURCE)/env_common.sh

# based on mkl link adviser, we should not need -lmkl_def
# but without it, it causes mkl load error at run time
export MUMPS_BLASLAPACK_FLAG="-L"${MKLROOT}" -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -lmkl_def"

# we use no-MPI MUMPS and need to build PetraM_MUMPS correspondingly
export MUMPSSOLVE_USE_MPISEQ=1



