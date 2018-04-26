#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/MUMPS_5.1.2
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

MYPATH=$(realpath "$0")
echo $MYPATH

MAKEINC=$(dirname "$MYPATH")/../extra/MUMPS/MUMPS_${TwoPiDevice}_PAR_Makefile.inc
cp $MAKEINC ${REPO}/Makefile.inc
cd ${REPO}

$MAKE all
$MAKE



