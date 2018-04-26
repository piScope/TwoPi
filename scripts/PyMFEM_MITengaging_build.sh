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
export MPICHINC=/home/software/intel/2017-01/compilers_and_libraries_2017.1.132/linux/mpi/intel64/include
export MPICHLNK=/home/software/intel/2017-01/compilers_and_libraries_2017.1.132/linux/mpi/intel64/lib

#Boost
export BOOSTINCDIR=/cm/shared/engaging/boost/1.56.0/include
export BOOSTLIBDIR=/cm/shared/engaging/boost/1.56.0/lib


$MAKE ser
$MAKE par
$MAKE pyinstall PREFIX=${TwoPiRoot}
