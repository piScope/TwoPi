#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

HYPREDIR=${SRCDIR}/hypre-${HYPRE_VERSION}

mkdir -p ${HYPREDIR}/src/cmbuild
cd ${HYPREDIR}/src/cmbuild
rm ${HYPREDIR}/src/cmbuild/*

$CMAKE .. -DCMAKE_VERBOSE_MAKEFILE=1                                     \
          -DBUILD_SHARED_LIBS=1                                          \
          -DHYPRE_INSTALL_PREFIX=${TwoPiRoot}                            \
          -DHYPRE_SHARED=1                                               \
          -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}                            \
          -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib                            

$MAKE $MAKEOPT verbose=1
$MAKE install

