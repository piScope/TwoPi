#!/bin/bash

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

DO_SERIAL=false
DO_PARALLEL=false
DO_DEFAULT=true

BOOST_ROOT=/usr/common/software/boost/1.70.0/intel/haswell
MPI_ROOT=/opt/cray/pe/mpt/7.7.8/gni/mpich-intel/16.0

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
    ;;
    --mpi-root)
    MPI_ROOT=$2
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
export CXX_SER=icpc
export CC_SER=icc
export MFEM=${TwoPiRoot}/mfem-git/par
export MFEMBUILDDIR=${TwoPiRoot}/src/mfem-git/cmbuild_par
export MFEMSER=${TwoPiRoot}/mfem-git/ser
export MFEMSERBUILDDIR=${TwoPiRoot}/src/mfem-git/cmbuild_ser
export HYPREINC=$TWOPIINC
export HYPRELIB=$TWOPILIB
export METIS5INC=$TWOPIINC
export METIS5LIB=$TWOPILIB

#MPI
export MPICHINC=${MPI_ROOT}/include
export MPICHLNK=${MPI_ROOT}/lib

#Boost
export BOOSTINC=${BOOST_ROOT}/include
export BOOSTLIB=${BOOST_ROOT}/lib

if $DO_SERIAL || $DO_DEFAULT ;then
    $MAKE ser
fi
if $DO_PARALLEL || $DO_DEFAULT ;then
    $MAKE par
fi

mkdir -p ${TwoPiRoot}/lib/python2.7/site-packages

$MAKE pyinstall PREFIX=${TwoPiRoot}
