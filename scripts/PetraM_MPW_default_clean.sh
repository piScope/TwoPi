#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MPW
MAKE=$(command -v make)

cd $REPO

${MAKE} clean_build
${MAKE} clean_ext
