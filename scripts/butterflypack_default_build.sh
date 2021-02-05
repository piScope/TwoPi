#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

_usage() {
    echo 'ButterflyPack large scale dense matrix solver with off-diagonal rank-deficiency'
}


SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/${BUTTERFLYPACK_REPO}

cd ${REPO}

mkdir -p cmbuild

cd cmbuild 

sh PrecisionPreprocessing.sh

cmake .. -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib \
         -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}       \
         -DCMAKE_CXX_COMPILER=${MPICXX}            \
         -DCMAKE_C_COMPILER=${MPICC}               \
         -DCMAKE_Fortran_COMPILER=${MPIFC}         \
         -DCMAKE_VERBOSE_MAKEFILE=1                \
         -DBUILD_SHARED_LIBS=on                    \
         -DCMAKE_MACOSX_RPATH=false                \
  	 -DTPL_BLAS_LIBRARIES="${BLAS_LIBRARIES}"           \
	 -DTPL_LAPACK_LIBRARIES="${LAPACK_LIBRARIES}"       \
	 -DTPL_SCALAPACK_LIBRARIES="${SCALAPACK_LIBRARIES}" \
	 -DTPL_ARPACK_LIBRARIES="${ARPACK_LIBBRARIES}"      \
	 -DCMAKE_BUILD_TYPE=release

make $MAKEOPT
make install


