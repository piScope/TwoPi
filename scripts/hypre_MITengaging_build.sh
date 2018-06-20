#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/mfem-git
HYPREDIR=${SRCDIR}/hypre-2.11.2
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

mkdir -p ${HYPREDIR}/src/cmbuild
cd ${HYPREDIR}/src/cmbuild
rm ${HYPREDIR}/src/cmbuild/*

$CMAKE .. -DCMAKE_VERBOSE_MAKEFILE=1 -DHYPRE_INSTALL_PREFIX=${TwoPiRoot} -DHYPRE_SHARED=1

$MAKE $MAKEOPT verbose=1
$MAKE install

