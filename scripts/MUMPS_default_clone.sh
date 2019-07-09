#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

mkdir -p $SRCDIR
cd $SRCDIR

wget http://graal.ens-lyon.fr/MUMPS/MUMPS_${MUMPS_VERSION}.tar.gz
tar -zxvf MUMPS_${MUMPS_VERSION}.tar.gz
rm MUMPS_${MUMPS_VERSION}.tar.gz


