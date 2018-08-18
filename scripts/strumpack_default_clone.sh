#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
mkdir -p $SRCDIR

cd $SRCDIR
wget https://github.com/pghysels/STRUMPACK/archive/v2.2.0.tar.gz -O strumpack.tar.gz
tar -zxvf strumpack.tar.gz
rm strumpack.tar.gz


