#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

mkdir -p $SRCDIR
cd $SRCDIR
wget http://github.com/swig/swig/archive/rel-4.0.2.tar.gz
tar -zxvf rel-4.0.2.tar.gz
rm rel-4.0.2.tar.gz

