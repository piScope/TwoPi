#!/bin/bash
CC=icc
CXX=icpc
FC=ifort
#MPICC=mpicc
#MPICXX=mpicxx
#MPIFC=mpif90
#MPIFL=mpif90
MPICC=mpiicc
MPICXX=mpiicpc
MPIFC=mpiifort
MPIFL=mpiifort
OMPFLAG="-qopenmp"
OMPLINKFLAG=-fopenmp
OMPCXXFLAG=-fopenmp
OMPCCFLAG=-fopenmp
OMPFCFLAG=-fopenmp

source $(dirname $BASH_SOURCE)/env_common.sh

# based on mkl link adviser, we should not need -lmkl_def
# but without it, it causes mkl load error at run time
export MUMPS_BLASLAPACK_FLAG="-L"${MKLROOT}" -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -lmkl_def"
export MUMPS_SCALAPACK_FLAG="-L"${MKLROOT}"/lib/intel64 -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64  -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core  -lmkl_def -liomp5 -lpthread -lm -ldl"
export MUMPS_INC_PAR="-I"$(MKLROOT)"/include"

# this flag controls if we use no-MPI MUMPS or not
export MUMPSSOLVE_USE_MPISEQ=0



