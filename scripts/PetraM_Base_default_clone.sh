#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_Base

mkdir -p $SRCDIR
if [ ! -f $REPO ]; then
   cd $SRCDIR
   $GIT clone https://github.com/piScope/PetraM_Base.git $REPO
   cd $REPO
fi
