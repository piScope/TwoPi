#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
mkdir -p $SRCDIR

MYPATH=$BASH_SOURCE
echo $MYPATH

OOCTGZ=$(dirname "$MYPATH")/../externals/${OCC}.tar.gz

cp $OOCTGZ $SRCDIR
cd  $SRCDIR
tar -zxvf ${OCC}.tar.gz
rm $SRCDIR/${OCC}.tar.gz
