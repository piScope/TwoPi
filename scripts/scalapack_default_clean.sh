#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SCALAPACKDIR=${SRCDIR}/scalapack-${SCALAPACK_VERSION}

rm -rf ${SCALAPACKDIR}/cmbuild


