#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/mfem-git

mkdir -p $SRCDIR
if [ ! -f $REPO ]; then
   cd $SRCDIR
   $GIT clone https://github.com/mfem/mfem.git $REPO
   cd $REPO
   $GIT checkout 324d66b0c7fc75225e830dcfb02647722bae1fe0
fi



