#!/bin/sh

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/mfem-git
TWOPILIB=${TWOPI}/lib
TWOPIINC=${TWOPI}/include

CMAKE=$(command -v cmake)
MAKE=$(command -v make)

cd $REPO

echo "############# configuring mfem serial"

mkdir -p $REPO/cmbuild_ser
cd $REPO/cmbuild_ser
rm -rf $REPO/cmbuild_ser/*

$CMAKE .. -DCMAKE_VERBOSE_MAKEFILE=1 -DBUILD_SHARED_LIBS=1 \
-DCMAKE_INSTALL_PREFIX=${TwoPiRoot}/mfem-git/ser -DMFEM_ENABLE_EXAMPLES=1 \
-DMFEM_USE_EXCEPTIONS=1

$MAKE $MAKEOPT
$MAKE install

