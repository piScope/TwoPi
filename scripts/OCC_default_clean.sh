#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

REPO=${SRCDIR}/${OCC}

cd $REPO
rm -rf cmbuild
