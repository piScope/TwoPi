#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

HYPREDIR=${SRCDIR}/hypre-${HYPRE_VERSION}

rm -rf ${HYPREDIR}/src/cmbuild
