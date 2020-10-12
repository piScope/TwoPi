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
}


_USE_SCOTCH_PTHREAD="ON"
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    --disable-soctch-pthread)
    _USE_SCOTCH_PTHREAD="OFF"
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
    sed -i s/-DSCOTCH_PTHREAD//g Makefile.inc
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
