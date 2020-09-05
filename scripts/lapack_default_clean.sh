#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

LAPACKDIR=${SRCDIR}/lapack-${LAPACK_VERSION}

rm -rf ${LAPACKDIR}/cmbuild


