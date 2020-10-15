#!/bin/bash

GIT=$(command -v git)
CMAKE=$(command -v cmake)
MAKE=$(command -v make)
SRCDIR=${TwoPiRoot}/src

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

_usage() {
    echo 'Scotch/PT-Scotch : Ordering Library'
    echo '   options: --disable-scotch-pthread'
    echo '   options: --int64 (enforce 64-bit integer type)'
    echo '   options: --int32 (enforce 32-bit integer type)'
    echo '   options: --debug (add -g)'
    echo '   options: --O0    (-O3 is replace to -O0)'
    echo '   options: --O1    (-O3 is replace to -O1)'
    echo '   options: --O2    (-O3 is replace to -O2)'    
}


_USE_SCOTCH_PTHREAD="ON"
_USE_INT64="OFF"
_USE_INT32="OFF"
_USE_DEBUG="OFF"
_USE_O0="OFF"
_USE_O1="OFF"
_USE_O2="OFF"
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    --disable-scotch-pthread)
    _USE_SCOTCH_PTHREAD="OFF"
    shift # past param
    ;;
    --int64)
    _USE_INT64="ON"
    shift # past param
    ;;
    --int32)
    _USE_INT32="ON"
    shift # past param
    ;;
    --debug)
    _USE_DEBUG="ON"	
    shift # past param
    ;;
    --O2)
    _USE_O2="ON"	
    shift # past param
    ;;
    --O1)
    _USE_O1="ON"	
    shift # past param
    ;;
    --O0)
    _USE_O0="ON"	
    shift # past param
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


REPO=${SRCDIR}/scotch_${SCOTCH_VERSION}
source $(dirname $BASH_SOURCE)/subs/find_mpi.sh

echo "MPI include path: "$MPI_INCLUDE_PATH

MYPATH=$BASH_SOURCE
echo $MYPATH

MAKEINC=$(dirname "$MYPATH")/../extra/scotch/scotch_${TwoPiDevice}_Makefile.inc
if [ ! -f $MAKEINC ]; then
   MAKEINC=$(dirname "$MYPATH")/../extra/scotch/scotch_default_Makefile.inc
fi
cp $MAKEINC ${REPO}/src/Makefile.inc
cd ${REPO}/src

if [[ "${_USE_SCOTCH_PTHREAD}" != "ON" ]]; then
    sed -i 's/-DSCOTCH_PTHREAD//g' Makefile.inc
fi
if [[ "${_USE_INT64}" == "ON" ]]; then
    sed -i 's/-DIDXSIZE64/-DINTSIZE64 -DIDXSIZE64/g' Makefile.inc
fi
if [[ "${_USE_INT32}" == "ON" ]]; then
    sed -i 's/-DIDXSIZE64/-DINTSIZE32 -DIDXSIZE64/g' Makefile.inc
fi
if [[ "${_USE_DEBUG}" == "ON" ]]; then
    sed -i 's/-O3/-g -O3/g' Makefile.inc
fi
if [[ "${_USE_O2}" == "ON" ]]; then
    sed -i 's/-O3/-O2/g' Makefile.inc
fi
if [[ "${_USE_O1}" == "ON" ]]; then
    sed -i 's/-O3/-O1/g' Makefile.inc
fi
if [[ "${_USE_O0}" == "ON" ]]; then
    sed -i 's/-O3/-O0/g' Makefile.inc
fi

###
CCD="$CC -I$MPI_INCLUDE_PATH"
echo ${CCD}
$MAKE scotch CCS="$CC" CCP="$MPICC" CCD="$CCD"
$MAKE ptscotch CCS="$CC" CCP="$MPICC" CCD="$CCD"
$MAKE esmumps CCS="$CC" CCP="$MPICC" CCD="$CCD"
$MAKE ptesmumps CCS="$CC" CCP="$MPICC" CCD="$CCD"
$MAKE install prefix="$TwoPiRoot"

CMAKELIST=$(dirname "$MYPATH")/../extra/scotch/CMakeLists.txt
cp $CMAKELIST ${REPO}/src/CMakeLists.txt
mkdir -p ${REPO}/src/cmbuild
cd ${REPO}/src/cmbuild
cmake .. -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib \
         -DCMAKE_INSTALL_RPATH=${TwoPiRoot}/lib   \
         -DCMAKE_INSTALL_PREFIX=${TwoPiRoot}

make VERBOSE=1
make install
