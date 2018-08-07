#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/scotch_6.0.6
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

MYPATH=$(realpath "$0")
echo $MYPATH

MAKEINC=$(dirname "$MYPATH")/../extra/scotch/scotch_${TwoPiDevice}_Makefile.inc
if [ ! -f $MAKEINC ]; then
   MAKEINC=$(dirname "$MYPATH")/../extra/scotch/scotch_default_Makefile.inc
fi
cp $MAKEINC ${REPO}/src/Makefile.inc
cd ${REPO}/src

CCD="$CC -I$MPI_INCLUDE_PATH"
echo ${CCD}
$MAKE scotch CCS="$CC" CCP="$MPICC" CCD="$CCD"
$MAKE ptscotch CCS="$CC" CCP="$MPICC" CCD="$CCD"
$MAKE install prefix="$TwoPiRoot"

CMAKELIST=$(dirname "$MYPATH")/../extra/scotch/CMakeLists.txt
cp $CMAKELIST ${REPO}/src/CMakeLists.txt
mkdir -p ${REPO}/src/cmbuild
cd ${REPO}/src/cmbuild
cmake .. -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}
make VERBOSE=1
make install
