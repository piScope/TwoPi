#!/bin/bash

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/glvis
TWOPILIB=${TWOPI}/lib
TWOPIINC=${TWOPI}/include

CMAKE=$(command -v cmake)
MAKE=$(command -v make)

cd $REPO
rm -rf  $REPO/cmbuild


