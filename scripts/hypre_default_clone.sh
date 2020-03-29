#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

mkdir -p $SRCDIR
cd $SRCDIR

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

wget https://github.com/hypre-space/hypre/archive/v${HYPRE_VERSION}.tar.gz -O hypre.tar.gz
tar -zxvf hypre.tar.gz
rm hypre.tar.gz

