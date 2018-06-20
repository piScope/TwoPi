#!/bin/sh

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/glvis
TWOPILIB=${TWOPI}/lib
TWOPIINC=${TWOPI}/include

CMAKE=$(command -v cmake)
MAKE=$(command -v make)

cd $REPO

echo "############# configuring glvis"

mkdir -p $REPO/cmbuild
cd $REPO/cmbuild
rm -rf $REPO/cmbuild/*

$CMAKE .. -DCMAKE_VERBOSE_MAKEFILE=1 \
-DCMAKE_INSTALL_PREFIX=${TwoPiRoot} \
-DMFEM_DIR=${TwoPiRoot}/src/mfem-git/cmbuild_ser

$MAKE $MAKEOPT
$MAKE install

