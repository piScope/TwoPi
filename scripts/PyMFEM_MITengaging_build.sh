#!/bin/bash

SCRIPT=$(dirname $BASH_SOURCE)/env_${TwoPiDevice}.sh
source $SCRIPT

DO_SERIAL=false
DO_PARALLEL=false
DO_DEFAULT=true
DO_SWIG=false
DO_CLEAN_SWIG=false

PUMI_INC="$TwoPiRoot"/include
PUMI_LIB="$TwoPiRoot"/lib

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --clean-swig)
    DO_CLEAN_SWIG=true
    shift # past argument    
    ;;
    --run-swig)
    DO_SWIG=true
    shift # past argument    
    ;;
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
    --with-pumi)
    ENABLE_PUMI=yes	
    shift # past argument
    ;;
    --pumi-include)
    ENABLE_PUMI=yes
    PUMI_INC=$2
    shift # past argument    
    shift # past param
    ;;
    --pumi-lib)
    ENABLE_PUMI=yes
    PUMI_LIB=$2
    shift # past argument    
    shift # past param
    ;;
    *)
    echo "Unknown option " $key
    exit 2  #  error_code=2
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

export MFEM=${TwoPiRoot}/mfem/par
export MFEMBUILDDIR=${TwoPiRoot}/src/mfem/cmbuild_par
export MFEMSER=${TwoPiRoot}/mfem/ser
export MFEMSERBUILDDIR=${TwoPiRoot}/src/mfem/cmbuild_ser
export HYPREINC=$TWOPIINC
export HYPRELIB=$TWOPILIB
export METIS5INC=$TWOPIINC
export METIS5LIB=$TWOPILIB
export ENABLE_PUMI="${ENABLE_PUMI}"
export PUMIINC="${PUMI_INC}"
export PUMILIB="${PUMI_LIB}"


export CC=${CC}
export CXX=${CXX}
export CXX11FLAG=$CXX11FLAG

if $DO_CLEAN_SWIG ;then
    $MAKE cleancxx
    exit 0
fi
if $DO_SWIG ;then
    $MAKE sercxx
    $MAKE parcxx   
    exit 0
fi   

if $DO_SERIAL || $DO_DEFAULT ;then
    $MAKE ser
fi

export CC=${MPICC}
export CXX=${MPICXX}
if $DO_PARALLEL || $DO_DEFAULT ;then
    $MAKE par
fi

$MAKE pyinstall PREFIX=${TwoPiRoot}
