#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

mkdir -p $SRCDIR
cd $SRCDIR

wget https://github.com/hypre-space/hypre/archive/v${HYPRE_VERSION}.tar.gz -O hypre.tar.gz
tar -zxvf hypre.tar.gz
rm hypre.tar.gz

