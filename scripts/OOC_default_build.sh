#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/opencascade-7.2.0
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd $REPO
mkdir -p cmbuild
ld
cd cmbuild
$CMAKE .. -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}
$MAKE $MAKEOPT
$MAKE install
