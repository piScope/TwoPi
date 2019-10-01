#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
mkdir -p ${TwoPiRoot}/src

cd  $SRCDIR
wget http://gmsh.info/src/${GMSH}-source.tgz
tar xfz ${GMSH}-source.tgz
rm ${GMSH}-source.tgz



