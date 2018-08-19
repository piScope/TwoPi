#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

mkdir -p $SRCDIR
if [ ! -f $REPO ]; then
   cd $SRCDIR
   $GIT clone https://github.com/piScope/PetraM_MUMPS.git $REPO
   cd $REPO
fi
