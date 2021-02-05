#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/${ZFP_REPO}

echo "Deleteing: " ${REPO}/cmbuild
rm -rf ${REPO}/cmbuild



