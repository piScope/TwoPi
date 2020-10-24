#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

mkdir -p $SRCDIR
cd $SRCDIR
wget https://gforge.inria.fr/frs/download.php/file/${SCOTCH_DL}/scotch_${SCOTCH_VERSION}.tar.gz
tar -zxvf scotch_${SCOTCH_VERSION}.tar.gz
rm scotch_${SCOTCH_VERSION}.tar.gz


