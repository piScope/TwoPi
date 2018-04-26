#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

MAKEINC=$(dirname "$0")/../extra/MUMPS/MUMPS_${TwoPiDevice}_PAR_Makefile.inc

cd ${SRCDIR}/MUMPS_5.1.2
cp $MAKEINC Makefile.inc

$MAKE all
$MAKE
$MAKE install



