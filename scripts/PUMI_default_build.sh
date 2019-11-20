#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PUMI
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd $REPO
mkdir -p cmbuild
cd $REPO/cmbuild

export PetraM=${TwoPiRoot}

cmake .. -DSCOREC_CXX_WARNINGS=OFF   \
      -DCMAKE_C_COMPILER=${MPICC}    \
      -DCMAKE_CXX_COMPILER=${MPICXX} \
      -DPUMI_FORTRAN_INTERFACE=OFF   \
      -DCMAKE_INSTALL_PREFIX=${TwoPiRoot} \
      -DBUILD_SHARED_LIBS=on

make
make install
