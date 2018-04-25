#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_Geom

mkdir -p $SRCDIR
if [ ! -f $REPO ]; then
   cd $SRCDIR
   $GIT clone git@github.com:piScope/PetraM_Geom.git $REPO    
   cd $REPO
fi
