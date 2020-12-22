#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/${BUTTERFLYPACK_REPO}

echo "Deleteing: " ${REPO}/cmbuild
rm -rf ${REPO}/cmbuild



