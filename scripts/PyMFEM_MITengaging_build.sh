#!/bin/bash
DO_SERIAL=false
DO_PARALLEL=false
DO_DEFAULT=true
BOOST_ROOT=/usr/local
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
    --boost-root)
    BOOST_ROOT=$2
    shift # past argument
    shift # past param
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
export MPICHINC=/home/software/intel/2017-01/compilers_and_libraries_2017.1.132/linux/mpi/intel64/include
export MPICHLNK=/home/software/intel/2017-01/compilers_and_libraries_2017.1.132/linux/mpi/intel64/lib

#Boost
export BOOSTINC=/cm/shared/engaging/boost/1.56.0/include
export BOOSTLIB=/cm/shared/engaging/boost/1.56.0/lib


if $DO_SERIAL || $DO_DEFAULT ;then
    $MAKE sercxx
    $MAKE ser
fi
if $DO_PARALLEL || $DO_DEFAULT ;then
    $MAKE parcxx
    $MAKE par
fi

mkdir -p ${TwoPiRoot}/lib/python2.7/site-packages

$MAKE pyinstall PREFIX=${TwoPiRoot}
