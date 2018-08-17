#!/bin/sh
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/${STRUMPACK_REPO}

echo "Deleteing: " ${REPO}/cmbuild
rm -rf ${REPO}/cmbuild



