#!/bin/sh
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/${STRUMPACK_REPO}

cd ${REPO}
mkdir -p cmbuild

cd cmbuild 

export METISDIR=${TwoPiRoot}
export PARMETISDIR=${TwoPiRoot}
export SCOTCHDIR=${TwoPiRoot}

cmake .. -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib \
         -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}       \
         -DCMAKE_CXX_COMPILER=${MPICXX}            \
         -DCMAKE_C_COMPILER=${MPICC}               \
         -DCMAKE_Fortran_COMPILER=${MPIFC}         \
         -DCMAKE_VERBOSE_MAKEFILE=1                \
         -DBUILD_SHARED_LIBS=on                    \
         -DSTRUMPACK_USE_PARMETIS=ON               \
         -DSTRUMPACK_USE_SCOTCH=ON                 \
         -DCMAKE_MACOSX_RPATH=false

make VERBOSE=1
make install


