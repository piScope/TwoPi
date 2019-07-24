#!/bin/bash

SCRIPT=$(dirname $BASH_SOURCE)/env_${TwoPiDevice}.sh
source $SCRIPT

DO_SWIG=false
DO_CLEAN_SWIG=false

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
    *)
    echo "Unknown option " $key
    exit 2  #  error_code=2
    ;;
esac
done

### 
# set MPI and Booost related variable (This should happen before cd below)
#source $(dirname $BASH_SOURCE)/subs/find_mpi.sh
###

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PySTRUMPACK

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

MAKE=$(command -v make)
PYTHON=$(command -v python)
cd $REPO

touch Makefile.local

export CC=${MPICC}
export CXX=${MPICXX}
export STRUMPACKINCDIR=${TwoPiRoot}/include
export STRUMPACKLNKDIR=${TwoPiRoot}/lib

if $DO_CLEAN_SWIG ;then
    $MAKE cleancxx
    exit 0
fi
if $DO_SWIG ;then
    $MAKE cxx
    exit 0
fi


$PYTHON setup.py install --prefix=${TwoPiRoot}
