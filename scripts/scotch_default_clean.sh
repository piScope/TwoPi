#!/bin/bash

GIT=$(command -v git)
CMAKE=$(command -v cmake)
MAKE=$(command -v make)
SRCDIR=${TwoPiRoot}/src

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

REPO=${SRCDIR}/scotch_${SCOTCH_VERSION}

cd ${REPO}/src
make realclean
