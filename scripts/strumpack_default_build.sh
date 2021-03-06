#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

_usage() {
    echo 'STRUMPACK : direct solver'
}


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
         -DCMAKE_CUDA_HOST_COMPILER=${MPICXX}      \
         -DCMAKE_C_COMPILER=${MPICC}               \
         -DCMAKE_Fortran_COMPILER=${MPIFC}         \
         -DCMAKE_VERBOSE_MAKEFILE=1                \
         -DBUILD_SHARED_LIBS=on                    \
	 -DTPL_ENABLE_PARMETIS=on                  \
         -DTPL_ENABLE_SCOTCH=ON                    \
	 -DTPL_ENABLE_PTSCOTCH=ON	           \
  	 -DTPL_BLAS_LIBRARIES="${BLAS_LIBRARIES}"           \
	 -DTPL_LAPACK_LIBRARIES="${LAPACK_LIBRARIES}"       \
	 -DTPL_SCALAPACK_LIBRARIES="${SCALAPACK_LIBRARIES}" \
         -DCMAKE_MACOSX_RPATH=false                         \
         -DCMAKE_CUDA_FLAGS="-I"${MPI_INCLUDE}"

make $MAKEOPT
make install


