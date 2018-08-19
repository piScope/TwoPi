#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/MUMPS_5.1.2
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

MYPATH=$(realpath "$0")
echo $MYPATH

cd ${REPO}
make clean
