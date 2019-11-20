#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PUMI/python_wrappers
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT


BUILDDIR=$REPO/cmbuild

if [ -d ${BUILDDIR} ];then
    cd ${BUILDDIR}
    rm -rf *
fi
