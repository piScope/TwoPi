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

if [[ -z "${MUMPSSOLVE_USE_MPISEQ}" ]]; then
  USE_SERIAL=0
else
  USE_SERIAL="${MUMPSSOLVE_USE_MPISEQ}"
fi

if [ "${USE_SERIAL}" -eq "1" ]; then
   MAKEINC=$(dirname "$MYPATH")/../extra/MUMPS/MUMPS_${TwoPiDevice}_serial_Makefile.inc
else
   MAKEINC=$(dirname "$MYPATH")/../extra/MUMPS/MUMPS_${TwoPiDevice}_Makefile.inc
fi


if [ ! -f $MAKEINC ]; then
    MAKEINC=$(dirname "$MYPATH")/../extra/MUMPS/MUMPS_default_Makefile.inc
fi

echo $MAKEINC
cp $MAKEINC ${REPO}/Makefile.inc
cd ${REPO}

$MAKE alllib MPICC=${MPICC} MPIFC=${MPIFC} OMPFCFLAG=${OMPFCFLAG} \
      OMPLINKFLAG=${OMPLINKFLAG} OMPCCFLAG=${OMPCCFLAG} $MAKEOPT
$MAKE all MPICC=${MPICC} MPIFC=${MPIFC} OMPFCFLAG=${OMPFCFLAG} \
      OMPLINKFLAG=${OMPLINKFLAG} OMPCCFLAG=${OMPCCFLAG} $MAKEOPT






