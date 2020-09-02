#!/bin/bash
#

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

SCRIPT_FULLPATH=$(realpath $(dirname "$0"))

SCRIPT=${SCRIPT_FULLPATH}/env_${TwoPiDevice}.sh
source $SCRIPT

mkdir -p $SRCDIR
cd $SRCDIR
wget https://github.com/Reference-LAPACK/lapack/archive/v{LAPACK_VERSION}.tar.gz -O lapack.tar.gz
tar -zxvf lapack.tar.gz
rm lapack.tar.gz

