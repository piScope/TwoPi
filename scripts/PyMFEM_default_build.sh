#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PyMFEM

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

MAKE=$(command -v make)
cd $REPO
touch Makefile.local

export MFEM=${TwoPiRoot}/mfem-git/par
export MFEMBUILDDIR=${TwoPiRoot}/src/mfem-git/cmbuild_par
export MFEMSER=${TwoPiRoot}/mfem-git/ser
export MFEMSERBUILDDIR=${TwoPiRoot}/src/mfem-git/cmbuild_ser
export HYPREINC=$TWOPIINC
export HYPRELIB=$TWOPILIB
export METIS5INC=$TWOPIINC
export METIS5LIB=$TWOPILIB

#MPI
export MPICHINC=/usr/local/include
export MPICHLNK=/usr/local/lib

#Boost
export BOOSTINCDIR=/usr/local/include
export BOOSTLIBDIR=/usr/local/lib


$MAKE ser
$MAKE par
$MAKE pyinstall PREFIX=${TwoPiRoot}
