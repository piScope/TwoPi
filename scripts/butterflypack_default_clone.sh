#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
mkdir -p $SRCDIR

cd $SRCDIR
wget https://github.com/liuyangzhuan/ButterflyPACK/archive/v1.2.1.tar.gz -O butterflypack.tar.gz
tar -zxvf butterflypack.tar.gz
rm butterflypack.tar.gz
