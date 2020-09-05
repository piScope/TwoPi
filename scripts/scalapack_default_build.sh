#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SCALAPACKDIR=${SRCDIR}/scalapack-${SCALAPACK_VERSION}

export CXX=${MPICXX}
export CC=${MPICC}

mkdir -p ${SCALAPACKDIR}/cmbuild
cd ${SCALAPACKDIR}/cmbuild

$CMAKE .. -DCMAKE_VERBOSE_MAKEFILE=1 \
          -DBUILD_SHARED_LIBS=1  \
          -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}/scalapack             

make ${MAKE_OPT}
make install




