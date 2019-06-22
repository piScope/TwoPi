#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
HYPREDIR=${SRCDIR}/hypre-2.11.2
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

export CXX=${MPICXX}
export CC=${MPICC}

rm -rf ${HYPREDIR}/src/cmbuild
