#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/scotch_6.0.6
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

MYPATH=$(realpath "$0")
echo $MYPATH

MAKEINC=$(dirname "$MYPATH")/../extra/scotch/scotch_${TwoPiDevice}_Makefile.inc
if [ ! -f $MAKEINC ]; then
   MAKEINC=$(dirname "$MYPATH")/../extra/scotch/scotch_default_Makefile.inc
fi
cp $MAKEINC ${REPO}/src/Makefile.inc
cd ${REPO}

$MAKE all
$MAKE



