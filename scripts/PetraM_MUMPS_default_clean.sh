#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

DD=$PWD

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT


MAKE=$(command -v make)
cd $REPO/mumps_solve
rm -rf cmbuild

cd $REPO/
${MAKE} clean

cd $DD
