#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
mkdir -p $SRCDIR

cd $SRCDIR
wget https://github.com/LLNL/zfp/releases/download/0.5.5/zfp-0.5.5.tar.gz -O zfp.tar.gz
tar -zxvf zfp.tar.gz
rm zfp.tar.gz
