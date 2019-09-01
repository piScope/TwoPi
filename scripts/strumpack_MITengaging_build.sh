#!/bin/bash
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

#MKLROOT is set by module load psfc/mkl/18
#MKLROOT=/home/software/intel/2018-01/compilers_and_libraries_2018.1.163/linux/mkl/lib/intel64
#export SCALAPACKFLAG="-lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread"
#export SCALAPACKFLAG="-L"${MKLROOT}"/lib/intel64 -lmkl_scalapack_lp64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -lmkl_blacs_intelmpi_lp64 -liomp5 -lpthread"
#export SCALAPACKFLAG="-L/home/software/intel/2018-01/compilers_and_libraries_2018.1.163/linux/mkl/lib/intel64_lin/ -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64 -liomp5 -lpthread"

cmake .. -DCMAKE_BUILD_TYPE=Release                \
         -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib \
         -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}       \
         -DCMAKE_CXX_COMPILER=${MPICXX}            \
         -DCMAKE_C_COMPILER=${MPICC}               \
         -DCMAKE_Fortran_COMPILER=${MPIFC}         \
         -DCMAKE_VERBOSE_MAKEFILE=1                \
         -DBUILD_SHARED_LIBS=on                    \
	 -DTPL_ENABLE_PARMETIS=off                 \
         -DCMAKE_EXE_LINKER_FLAGS="${MKL_SCALAPACK_LINK}" \
         -DCMAKE_MACOSX_RPATH=false

make VERBOSE=1
make install


