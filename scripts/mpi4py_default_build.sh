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

mkdir -p ${WDIR}
cd ${WDIR}

pip3 download --no-binary=:all: --dest . mpi4py

file = $(ls *.tar.gz)
echo $(file)
