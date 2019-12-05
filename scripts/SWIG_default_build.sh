#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/swig-rel-4.0.1
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd ${REPO}
${REPO}/autogen.sh
${REPO}/configure --prefix=${TwoPiRoot}
$MAKE
$MAKE install
