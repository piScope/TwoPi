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

# path to mpi.h
#    (note) It appears find_mpi does not work with CC (cray MPI compiler)
MPI_INCLUDE_PATH=/opt/cray/pe/mpt/7.7.10/gni/mpich-intel/16.0/include
MPI_LIBRARY_PATH=/opt/cray/pe/mpt/7.7.10/gni/mpich-intel/16.0/lib

# enforce scotch to 6.0.6
#SCOTCH_DL=37622
#SCOTCH_VERSION=6.0.6


