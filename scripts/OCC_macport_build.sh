b#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/opencascade-7.3.0
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd $REPO
mkdir -p cmbuild
cd cmbuild
$CMAKE .. -DCMAKE_VERBOSE_MAKEFILE=1         \
          -DCMAKE_INSTALL_PREFIX=${TwoPiRoot} \
          -DCMAKE_C_COMPILER=clang            \
          -DCMAKE_CXX_COMPILER=clang++         \
          -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib	  
#          -DCMAKE_C_COMPILER=clang           \
#          -DCMAKE_CXX_COMPILER=clang++         \

$MAKE $MAKEOPT
$MAKE install
