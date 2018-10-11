#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=$SRCDIR/${GMSH}-source
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

mkdir -p $REPO/cmbuild
cd $REPO/cmbuild
$CMAKE .. -DCMAKE_INSTALL_PREFIX=${TwoPiRoot} \
          -DCMAKE_INSTALL_RPATH=${TwoPiRoot}  \
          -DENABLE_BUILD_DYNAMIC=1            \
	  -DENABLE_OS_SPECIFIC_INSTALL=0      \
          -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib 

$MAKE $MAKEOPT
$MAKE install

ln -s $TwoPiRoot/lib/gmsh.py gmsh.py
