#!/bin/bash

GIT=$(command -v git)
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/${MUMPS_REPO}

MYPATH=$BASH_SOURCE
echo $MYPATH

cd ${REPO}
echo $PWD
${MAKE} clean
