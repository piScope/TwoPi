#!/bin/sh

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

DO_SERIAL=false
DO_PARALLEL=false
DO_DEFAULT=true
BOOST_ROOT=/usr/local
MPI_ROOT=/usr/local
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
    --boost-lib)
    BOOST_LIB=$2
    shift # past argument
    shift # past param
    ;;
    --boost-inc)
    BOOST_INC=$2
    shift # past argument
    shift # past param
    ;;
    --mpi-root)
    MPI_ROOT=$2
    shift # past argument
    shift # past param
    ;;
    --mpi-lib)
    MPI_LIB=$2
    shift # past argument
    shift # past param
    ;;
    --mpi-inc)
    MPI_INC=$2
    shift # past argument
    shift # past param
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
if [ -z ${MPI_INC+x} ];then
   export MPICHINC=${MPI_ROOT}/include
else
   export MPICHINC=${MPI_INC}
fi
if [ -z ${MPI_LIB+x} ];then
   export MPICHLNK=${MPI_ROOT}/lib
else
   export MPICHLNK=${MPI_LIB}
fi

#Boost
if [ -z ${BOOST_INC+x} ];then
   export BOOSTINC=${BOOST_ROOT}/include
else
   export BOOSTINC=${BOOST_INC}
fi
if [ -z ${BOOST_LIB+x} ];then
   export BOOSTLIB=${BOOST_ROOT}/lib
else
   export BOOSTLIB=${BOOST_LIB}
fi

if $DO_SERIAL || $DO_DEFAULT ;then
    $MAKE ser
fi
if $DO_PARALLEL || $DO_DEFAULT ;then
    $MAKE par
fi

mkdir -p ${TwoPiRoot}/lib/python2.7/site-packages

$MAKE pyinstall PREFIX=${TwoPiRoot}
