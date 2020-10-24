#!/bin/bash
#export PATH=/usr/local/opt/llvm/bin:$PATH

#CC=/usr/local/opt/llvm/bin/clang
#CXX=/usr/local/opt/llvm/bin/clang++
CC=clang
CXX=clang++
FC=gfortran
MPICC=mpicc
MPICXX=mpicxx
MPIFC=mpif90
MPIFL=mpif90
# No OpenMP : Apple compiler does not support -fopenmp
#             There is a way to turn-on but it involves
#             playing with multiple compiler flags.
OMPFLAG=
OMPCXXFLAG=
#OMPLINKFLAG=
#OMPCCFLAG=
#OMPFCFLAG=
OMPLINKFLAG=-fopenmp
OMPCCFLAG=-fopenmp
OMPFCFLAG=-fopenmp
# if you want to use OpenMP with LLVM 
#OMPFLAG="-fopenmp"  # -fopenmp (gcc/clang) -qopenmp (intel)
#OMPFLAG=-fopenmp=libomp
#OMPLINKFLAG=-fopenmp
#OMPCXXFLAG=-fopenmp=libomp
#OMPCCFLAG=-fopenmp=libomp
#OMPFCFLAG=-fopenmp
#export PATH=/usr/local/opt/llvm/bin:$PATH

echo "$0" $0
source $(dirname $BASH_SOURCE)/env_common.sh
