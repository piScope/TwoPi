#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/opencascade-7.2.0
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

cp $REPO
mkdir -p cmbuild
cd cmbuild
$CMAKE .. -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}
$MAKE
$MAKE install
