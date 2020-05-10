#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=$SRCDIR/${PyOCC}
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

if [ ! -d ${REPO} ];then
    echo "PythonOCC repo does not exist in"  ${REPO}
    exit 1
fi

mkdir -p $REPO/cmbuild
cd $REPO/cmbuild
$CMAKE .. -DCMAKE_INSTALL_PREFIX=${TwoPiRoot} \
          -DCMAKE_INSTALL_RPATH=${TwoPiRoot}  \
          -DCMAKE_C_COMPILER=${CC}            \
          -DCMAKE_CXX_COMPILER=${CXX}         

$MAKE VERBOSE=1 $MAKEOPT
$MAKE install


