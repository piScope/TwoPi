#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

MAKE=$(command -v make)
cd $REPO
cp Makefile_templates/Makefile_default Makefile

export PetraM=${TwoPiRoot}

$MAKE
$MAKE install
