#!/bin/bash
CC=icc
CXX=icpc
FC=ifort
FL=ifort
MPICC=cc
MPICXX=CC
MPIFC=ftn
MPIFL=ftn
OMPFLAG="-qopenmp"
OMPLINKFLAG=-qopenmp
OMPCXXFLAG=-qopenmp
OMPCCFLAG=-qopenmp
OMPFCFLAG=-qopenmp

source $(dirname $BASH_SOURCE)/env_common.sh

#echo $MPI_INCLUDE_PATH



