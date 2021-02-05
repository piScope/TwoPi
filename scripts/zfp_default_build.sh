#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

_usage() {
    echo 'ZFP : floating point compression library'
}


SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/${ZFP_REPO}

cd ${REPO}

mkdir -p cmbuild

cd cmbuild 

pip install -r ${REPO}/python/requirements.txt

cmake .. -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib \
         -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}       \
         -DCMAKE_CXX_COMPILER=${CXX}               \
         -DCMAKE_C_COMPILER=${CC}                  \
         -DCMAKE_VERBOSE_MAKEFILE=1                \
         -DBUILD_ZFPY=1                            \
         -DBUILD_SHARED_LIBS=on                    \
         -DCMAKE_MACOSX_RPATH=false                \
	 -DCMAKE_BUILD_TYPE=release

make $MAKEOPT
make install


