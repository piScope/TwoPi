#!/bin/bash

_usage() {
    echo 'PetraM_MUMPS : MUMPS wrapper for Petra-M'
    echo '   options: --clean-swig'
    echo '            --run-swig'    
    echo '            --help'
}


MAKE=$(command -v make)
SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
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

if $DO_SWIG ;then
    cd ${REPO}    
    MUMPS_INC=${SRCDIR}/${MUMPS_REPO}/include
    export MUMPS_INC_DIR=${MUMPS_INC}
    $MAKE cxx
    exit 0
fi
if $DO_CLEAN_SWIG ;then
    cd ${REPO}
    MUMPS_INC=${SRCDIR}/${MUMPS_REPO}/include
    $MAKE cleancxx
    exit 0
fi

SCRIPT=$(dirname "$0")/buildcomponent.sh
${SCRIPT} PetraM_MUMPS build1
${SCRIPT} PetraM_MUMPS build2

