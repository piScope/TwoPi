#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PyMFEM

mkdir -p $SRCDIR
if [ ! -f $REPO ]; then
   cd $SRCDIR
   $GIT clone https://github.com/sshiraiwa/PyMFEM.git $REPO
   cd $REPO
fi
