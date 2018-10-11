#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/MUMPS_5.1.2
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

# find MPI 
source $(dirname "$0")/subs/find_mpi.sh
#source $(dirname "$0")/subs/find_lapack.sh

MYPATH=$(realpath "$0")
echo $MYPATH

MAKEINC=$(dirname "$MYPATH")/../extra/MUMPS/MUMPS_${TwoPiDevice}_PAR_Makefile.inc
if [ ! -f $MAKEINC ]; then
    MAKEINC=$(dirname "$MYPATH")/../extra/MUMPS/MUMPS_default_PAR_Makefile.inc
fi
cp $MAKEINC ${REPO}/Makefile.inc
cd ${REPO}

$MAKE all MPICC=${MPICC} MPIFC=${MPIFC} OMPFCFLAG=${OMPFCFLAG} \
      OMPLINKFLAG=${OMPLINKFLAG} OMPCCFLAG=${OMPCCFLAG} \
      MPI_LIBRARY_PATH=${MPI_LIBRARY_PATH} \
      MPI_INCLUDE_PATH=${MPI_INCLUDE_PATH}




