#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

WDIR=${SRCDIR}/mpi4py

export CXX=${MPICXX}
export CC=${MPICC}

cd ${WDIR}

pip3 download mpi4py --no-binary --dest ./
file = $(ls *.tar.gz)
