#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MPW
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd $REPO

echo ${TwoPiRoot}
export PetraM=${TwoPiRoot}

DO_DEFAULT=true
DO_SWIG=false
DO_CLEAN_SWIG=false
DO_CLEAN_ALL=false

_usage() {
    echo 'PetraM_Base_ext : extension module for PetraM_Base'
    echo '   options: --clean-all'
    echo '            --clean-swig'
    echo '            --run-swig'
}
    
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    --clean-all)
    DO_CLEAN_ALL=true
    DO_DEFAULT=false	
    shift # past argument    
    ;;
    --clean-swig)
    DO_CLEAN_SWIG=true
    DO_DEFAULT=false	
    shift # past argument    
    ;;
    --run-swig)
    DO_SWIG=true
    DO_DEFAULT=false		
    shift # past argument    
    ;;
    --help)
    _usage
    exit 1
    ;;
    *)
    echo "Unknown option " $key
    exit 2  #  error_code=2
    ;;
esac
done

if $DO_CLEAN_ALL ;then
    $MAKE clean PREFIX=${TwoPiRoot} MPICC=${MPICC} MPICXX=${MPICXX} CC=${CC} CXX=${CXX} NUMPY_FCOMPILER="${NUMPY_FCOMPILER}"
fi
if $DO_CLEAN_SWIG ;then
    $MAKE clean_so PREFIX=${TwoPiRoot} MPICC=${MPICC} MPICXX=${MPICXX} CC=${CC} CXX=${CXX} NUMPY_FCOMPILER="${NUMPY_FCOMPILER}"
fi
if $DO_SWIG ;then
    $MAKE cxx PREFIX=${TwoPiRoot} MPICC=${MPICC} MPICXX=${MPICXX} CC=${CC} CXX=${CXX} NUMPY_FCOMPILER="${NUMPY_FCOMPILER}"
fi
if $DO_DEFAULT ;then
    $MAKE PREFIX=${TwoPiRoot} MPICC=${MPICC} MPICXX=${MPICXX} CC=${CC} CXX=${CXX} NUMPY_FCOMPILER="${NUMPY_FCOMPILER}"
fi


