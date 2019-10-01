#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

REPO=${SRCDIR}/${MUMPS_REPO}

# find MPI 
#source $(dirname "$0")/subs/find_mpi.sh
#source $(dirname "$0")/subs/find_lapack.sh

MYPATH=$BASH_SOURCE
echo $MYPATH

MAKEINC=$(dirname "$MYPATH")/../extra/MUMPS/MUMPS_${TwoPiDevice}_Makefile.inc
if [ ! -f $MAKEINC ]; then
    MAKEINC=$(dirname "$MYPATH")/../extra/MUMPS/MUMPS_default_Makefile.inc
fi
cp $MAKEINC ${REPO}/Makefile.inc
cd ${REPO}

$MAKE alllib MPICC=${MPICC} MPIFC=${MPIFC} OMPFCFLAG=${OMPFCFLAG} \
      OMPLINKFLAG=${OMPLINKFLAG} OMPCCFLAG=${OMPCCFLAG} $MAKEOPT
$MAKE all MPICC=${MPICC} MPIFC=${MPIFC} OMPFCFLAG=${OMPFCFLAG} \
      OMPLINKFLAG=${OMPLINKFLAG} OMPCCFLAG=${OMPCCFLAG} $MAKEOPT

#$MAKE all MPICC=${MPICC} MPIFC=${MPIFC} OMPFCFLAG=${OMPFCFLAG} \
#      OMPLINKFLAG=${OMPLINKFLAG} OMPCCFLAG=${OMPCCFLAG} \
#      MPI_LIBRARY_PATH=${MPI_LIBRARY_PATH} \
#      MPI_INCLUDE_PATH=${MPI_INCLUDE_PATH}




