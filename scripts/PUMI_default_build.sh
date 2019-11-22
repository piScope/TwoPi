#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PUMI
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd $REPO
mkdir -p cmbuild
cd $REPO/cmbuild

export PetraM=${TwoPiRoot}

DO_TEST=false
ENABLE_SIMMETRIX=OFF
ENABLE_PARASOLID=OFF
SIMMETRIX_LIB_DIR=''
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    --with-test)
    DO_TEST=true
    shift # past argument    
    ;;
    --with-simmetrix)
    ENABLE_SIMMETRIX=ON
    ENABLE_PARASOLID=ON	
    shift # past argument    
    ;;
    --simmetrix-lib)
    SIMMETRIX_LIB_DIR=$2
    shift # past argument
    shift # past argument
    ;;
    *)
    echo "Unknown option " $key
    exit 2  #  error_code=2
    ;;
esac
done

if $DO_TEST ;then
    cmake .. -DSCOREC_CXX_WARNINGS=OFF   \
             -DCMAKE_C_COMPILER="${MPICC}"    \
             -DCMAKE_CXX_COMPILER="${MPICXX}" \
             -DPUMI_FORTRAN_INTERFACE=OFF   \
	     -DSCOREC_CXX_OPTIMIZE=ON       \
             -DSCOREC_CXX_WARNINGS=ON       \
             -DCMAKE_INSTALL_PREFIX="${TwoPiRoot}" \
             -DBUILD_SHARED_LIBS=on   \
             -DCMAKE_VERBOSE_MAKEFILE=1 \
             -DIS_TESTING=ON \
	     -DENABLE_SIMMETRIX="${ENABLE_SIMMETRIX}" \
             -DSIM_PARASOLID="${ENABLE_PARASOLID}"   \
	     -DSIMMETRIX_LIB_DIR="${SIMMETRIX_LIB_DIR}"  \
             -DMESHES="${TwoPiRoot}"/src/PUMI-MESHES \
             -DCMAKE_BUILD_TYPE="Debug" 
else
    cmake .. -DSCOREC_CXX_WARNINGS=OFF   \
             -DCMAKE_C_COMPILER="${MPICC}"    \
             -DCMAKE_CXX_COMPILER="${MPICXX}" \
             -DPUMI_FORTRAN_INTERFACE=OFF   \
	     -DSCOREC_CXX_OPTIMIZE=ON       \
             -DSCOREC_CXX_WARNINGS=ON       \
             -DCMAKE_INSTALL_PREFIX="${TwoPiRoot}" \
             -DBUILD_SHARED_LIBS=on   \
             -DENABLE_SIMMETRIX="${ENABLE_SIMMETRIX}" \
             -DSIM_PARASOLID="${ENABLE_PARASOLID}"   \
	     -DSIMMETRIX_LIB_DIR="${SIMMETRIX_LIB_DIR}"  \
             -DCMAKE_VERBOSE_MAKEFILE=1 
fi
make "${MAKEOPT}"
make install
