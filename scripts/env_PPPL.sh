#!/bin/bash
CC=icc
CXX=icpc
FC=ifort
MPICC=mpicc
MPICXX=mpicxx
MPIFC=mpif90
MPIFL=mpif90
OMPFLAG="-qopenmp"
OMPLINKFLAG=-qopenmp
OMPCXXFLAG=-qopenmp
OMPCCFLAG=-qopenmp
OMPFCFLAG=-qopenmp

source $(dirname $BASH_SOURCE)/env_common.sh

# based on mkl link adviser, we should not need -lmkl_def
# but without it, it causes mkl load error at run time
#export MUMPS_BLASLAPACK_FLAG="-L/p/rf/sshiraiw/twopi_roots/20200429/src/lapack -llapack"
#export MUMPS_SCALAPACK_FLAG="-L/p/rf/sshiraiw/twopi_roots/20200429/src/scalapack-2.1.0 -lscalapack  -L/p/rf/sshiraiw/twopi_roots/20200429/src/lapack -llapack"
export MUMPS_BLASLAPACK_FLAG="-L/p/rf/sshiraiw/twopi_roots/20200429/lapack/lib64 -llapack"
export MUMPS_SCALAPACK_FLAG="-L/p/rf/sshiraiw/twopi_roots/20200429/scalapack/lib -lscalapack  -L/p/rf/sshiraiw/twopi_roots/20200429/lapack/lib -llapack"


# this flag controls if we use no-MPI MUMPS or not
export MUMPSSOLVE_USE_MPISEQ=0



