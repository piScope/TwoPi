#!/bin/bash -x

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
mkdir -p $SRCDIR

MYPATH=$BASH_SOURCE
echo $MYPATH

ooc=opencascade-7.2.0.tgz
OOCTGZ=$(dirname "$MYPATH")/../externals/$ooc

cp $OOCTGZ $SRCDIR
cd  $SRCDIR
tar xf $ooc
rm $SRCDIR/$ooc
