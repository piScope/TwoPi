#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/mfem-git
TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd $REPO

echo "############# configuring mfem parallel"

mkdir -p $REPO/cmbuild_par
rm -rf $REPO/cmbuild_par


