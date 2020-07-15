#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

REPO=${SRCDIR}/${OCC}

cd $REPO
mkdir -p cmbuild
cd cmbuild
$CMAKE .. -DCMAKE_VERBOSE_MAKEFILE=1          \
          -DCMAKE_INSTALL_PREFIX=${TwoPiRoot} \
          -DCMAKE_C_COMPILER=${CC}            \
          -DCMAKE_CXX_COMPILER=${CXX}         \
          -DCMAKE_CXX_FLAGS=$CXX11FLAG        \
          -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib
$MAKE $MAKEOPT
$MAKE install
