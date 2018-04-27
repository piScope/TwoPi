#!/bin/sh

DO_SERIAL=false
DO_PARALLEL=false
DO_DEFAULT=true

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -s|--serial)
    DO_SERIAL=true
    DO_DEFAULT=false
    shift # past argument    
    ;;
    -p|--parallel)
    DO_PARALLELE=true
    DO_DEFAULT=false
    shift # past argument
    ;;
esac
done

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

if $DO_SERIAL || $DO_DEFAULT ;then
    $MAKE ser
fi
if $DO_PARALLEL || $DO_DEFAULT ;then
    $MAKE par
fi
$MAKE pyinstall PREFIX=${TwoPiRoot}
