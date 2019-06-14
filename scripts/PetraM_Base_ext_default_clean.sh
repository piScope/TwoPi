#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_Base_ext
MAKE=$(command -v make)

cd $REPO

${MAKE} clean_build
${MAKE} clean_ext

