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
rm -rf $REPO/cmbuild_ser


