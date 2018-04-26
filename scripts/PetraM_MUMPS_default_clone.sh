#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

mkdir -p $SRCDIR
if [ ! -d $REPO ]; then
   cd $SRCDIR
   $GIT clone git@github.com:piScope/PetraM_MUMPS.git $REPO    
   cd $REPO
else
   cd $REPO
   $GIT pull origin master
fi
