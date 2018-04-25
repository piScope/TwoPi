#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/mfem-git
HYPREDIR=${SRCDIR}/hypre-2.11.2
CMAKE=$(command -v cmake)
MAKE=$(command -v make)
MPICXX=$(command -v mpicxx)
MPICC=$(command -v mpicc)

mkdir -p ${HYPREDIR}/src/cmbuild
cd ${HYPREDIR}/src/cmbuild
rm ${HYPREDIR}/src/cmbuild/*

$CMAKE .. -DCMAKE_VERBOSE_MAKEFILE=1 -DHYPRE_INSTALL_PREFIX=${TwoPiRoot} -DHYPRE_SHARED=1 -DCMAKE_C_COMPILER=$MPICC -DCMAKE_CXX_COMPILER=$MPICXX

$MAKE verbose=1
$MAKE install

