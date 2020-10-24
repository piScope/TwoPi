#!/bin/bash

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
if [[ -z "${MUMPSSOLVE_USE_MPISEQ}" ]]; then
  USE_SERIAL=0
else
  USE_SERIAL="${MUMPSSOLVE_USE_MPISEQ}"
fi

if [ "${USE_SERIAL}" -eq "0" ]; then
    # empty
    if [[ -z "${MUMPS_SCALAPACK_FLAG}" ]]; then
        LAPACKFLAG=$(grep ^SCALAP ${TwoPiRoot}/src/${MUMPS_REPO}/Makefile.inc | cut -d = -f 2|awk '{$1=$1}1' -)
    else
        LAPACKFLAG=${MUMPS_SCALAPACK_FLAG}
    fi

else
    LAPACKFLAG=${MUMPS_BLASLAPACK_FLAG}
fi

echo ${LAPACKFLAG}

if [ "${USE_SERIAL}" -eq "0" ]; then
    CC1=${MPICC}
    CXX1=${MPICXX}
    FC1=${MPIFC}
    MUMPSSOLVE_USE_MPISEQ=off
else
    CC1=${CC}
    CXX1=${CXX}
    FC1=${FC}
fi
echo $PWD

cmake .. -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib  \
         -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}        \
         -DUSE_SCOTCH=${USE_SCOTCH}                 \
         -DUSE_METIS=${USE_METIS}                   \
	 -DLAPACK_FLAGS="${LAPACKFLAG}"             \
         -DMUMPS_INCLUDE_DIR=${TwoPiRoot}/src/${MUMPS_REPO}/include \
         -DMUMPS_LINK_DIR=${TwoPiRoot}/src/${MUMPS_REPO}/lib    \
         -DOpenMP_LINK_FLAG=${OMPLINKFLAG} \
         -DCMAKE_Fortran_COMPILER=${FC1}  \
         -DCMAKE_CXX_COMPILER=${CXX1} \
	 -DCMAKE_C_COMPILER=${CC1}   \
         -DMUMPSSOLVE_USE_MPISEQ=${MUMPSSOLVE_USE_MPISEQ}  \
         -DCMAKE_CXX_STANDARD=11

make VERBOSE=1
make install
