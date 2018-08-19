#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

mkdir -p $SRCDIR
cd $SRCDIR
wget http://github.com/swig/swig/archive/rel-3.0.12.tar.gz
tar -zxvf rel-3.0.12.tar.gz
rm rel-3.0.12.tar.gz

