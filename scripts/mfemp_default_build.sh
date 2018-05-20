#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/mfem-git
TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd $REPO

echo "############# configuring mfem parallel"

mkdir -p $REPO/cmbuild_par
cd $REPO/cmbuild_par
rm -rf $REPO/cmbuild_par/*

$CMAKE .. -DCMAKE_VERBOSE_MAKEFILE=1 -DBUILD_SHARED_LIBS=1                 \
-DCMAKE_INSTALL_PREFIX=${TwoPiRoot}/mfem-git/par -DMFEM_ENABLE_EXAMPLES=1  \
-DHYPRE_DIR=$TWOPILIB -DHYPRE_INCLUDE_DIRS=$TWOPIINC                       \
-DMETIS_DIR=$TWOPILIB -DMETIS_INCLUDE_DIRS=$TWOPIINC                       \
-DMFEM_USE_MPI=1 -DMFEM_USE_METIS_5=1 -DMFEM_ENABLE_EXAMPLES=1             \
-DCMAKE_CXX_COMPILER=$MPICXX  -DCMAKE_SHARED_LINKER_FLAGS="-L$TWOPILIB     \
-lHYPRE -lmetis" -DCMAKE_EXE_LINKER_FLAGS="-L$TWOPILIB -lHYPRE -lmetis"

$MAKE
$MAKE install

