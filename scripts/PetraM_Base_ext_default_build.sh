#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_Base_ext
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd $REPO

echo ${TwoPiRoot}
export PetraM=${TwoPiRoot}
$MAKE PREFIX=${TwoPiRoot} MPICC=${MPICC} MPICXX=${MPICXX} CC=${CC} CXX=${CXX}

###
### $MAKE all PREFIX=${TwoPiRoot}


