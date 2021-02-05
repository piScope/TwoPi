#!/bin/bash

CC=cc
CXX=c++
FC=gfortran
MPICC=mpicc
MPICXX=mpic++
MPIFC=mpif90
MPIFL=mpif90
OMPFLAG=-fopenmp
OMPLINKFLAG=-fopenmp
OMPCXXFLAG=-fopenmp
OMPCCFLAG=-fopenmp
OMPFCFLAG=-fopenmp

source $(dirname $BASH_SOURCE)/env_common.sh

#
# these are currently used only for STRUMPACK, ZPF, Butterflypack
#
BLAS_LIBRARIES='/usr/lib/x86_64-linux-gnu/libblas.so'
LAPACK_LIBRARIES='/usr/lib/x86_64-linux-gnu/liblapack.so;/usr/lib/x86_64-linux-gnu/libblas.so'
SCALAPACK_LIBRARIES='/usr/lib/x86_64-linux-gnu/libscalapack-openmpi.so'
ARPACK_LIBRARIES='/usr/lib/x86_64-linux-gnu/libarpack.so.2.1.0'
MPI_INCLUDE='/usr/lib/x86_64-linux-gnu/openmpi/include'
