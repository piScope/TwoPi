#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/mfem-git
HYPREDIR=${SRCDIR}/hypre-2.11.2
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

export CXX=${MPICXX}
export CC=${MPICC}

mkdir -p ${HYPREDIR}/src/cmbuild
cd ${HYPREDIR}/src/cmbuild
rm ${HYPREDIR}/src/cmbuild/*

$CMAKE .. -DCMAKE_VERBOSE_MAKEFILE=1 -DHYPRE_INSTALL_PREFIX=${TwoPiRoot} \
          -DHYPRE_SHARED=1                                               \
          -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}                            \
          -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib                            

# I am not sure if this works...
# -DCMAKE_C_COMPILER=$MPICC -DCMAKE_CXX_COMPILER=$MPICXX

$MAKE verbose=1
$MAKE install

#if [ "${TwoPiDevice}" == "brew" ]; then
#   install_name_tool -id ${TwoPiRoot}/lib/libHYPRE.dylib ${TwoPiRoot}/lib/libHYPRE.dylib
#fi

