#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

MAKE=$(command -v make)
cd $REPO/mumps_solve
mkdir -p cmbuild
cd cmbuild

# use ${SCALAP} in MUMPS Makefile.inc
LAPACKFLAG=$(grep ^SCALAP ${TwoPiRoot}/src/${MUMPS_REPO}/Makefile.inc | cut -d = -f 2|awk '{$1=$1}1' -)
echo ${LAPACKFLAG}

export CC=${MPICC}
export CXX=${MPICXX}
export FC=${MPIFC}

cmake .. -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib  \
         -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}        \
         -DMETIS_LINK_DIR=${TwoPiRoot}/lib              \
         -DLAPACK_FLAGS="${LAPACKFLAG}"               \
         -DPARMETIS_LINK_DIR=${TwoPiRoot}/lib           \
         -DMUMPS_INCLUDE_DIR=${TwoPiRoot}/src/${MUMPS_REPO}/include \
         -DMUMPS_LINK_DIR=${TwoPiRoot}/src/${MUMPS_REPO}/lib    \
         -DOpenMP_LINK_FLAG=${OMPLINKFLAG} \
         -DCMAKE_Fortran_COMPILER=${MPIFC}  \
         -DCMAKE_CXX_COMPILER=${MPICXX}     \
	 -DCMAKE_C_COMPILER=${MPICC}
make VERBOSE=1
make install
