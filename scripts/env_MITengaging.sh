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
OMPLINKFLAG="-qopenmp"
OMPCXXFLAG="-qopenmp"
OMPCCFLAG="-qopenmp"
OMPFCFLAG="-qopenmp"
NUMPY_FCOMPILER="--fcompiler intelem"
		
source $(dirname $BASH_SOURCE)/env_common.sh
export MKL_SCALAPACK_LINK="-L"${MKLROOT}"/lib/intel64 -lmkl_scalapack_lp64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -lmkl_blacs_intelmpi_lp64 -liomp5 -lpthread"
#echo $MPI_INCLUDE_PATH




