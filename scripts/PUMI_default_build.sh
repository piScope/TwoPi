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

export LIBRARY_PATH=/opt/SimModSuite/15.0-191017dev/lib:$LIBRARY_PATH
export CPATH=/opt/SimModSuite/15.0-191017dev/include:$CPATH

export LD_LIBRARY_PATH=/opt/SimModSuite/15.0-191017dev/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/SimModSuite/15.0-191017dev/lib/acisKrnl
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/SimModSuite/15.0-191017dev/lib/psKrnl

export CMAKE_PREFIX_PATH=/opt/SimModSuite/15.0-191017dev/:$CMAKE_PREFIX_PATH
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/opt/SimModSuite/15.0-191017dev/lib
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/opt/SimModSuite/15.0-191017dev/lib/acisKrnl
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/opt/SimModSuite/15.0-191017dev/lib/psKrnl

export SIMMETRIX_SIMMODSUITE_ROOT=/opt/SimModSuite/15.0-191017dev/
export SIM_LICENSE_FILE=/home/shiraiwa/.simmetrix/MIT_Shiraiwa_2019

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
             -DSIM_MPI=mpich3 \
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
             -DSIM_MPI=mpich3 \
             -DENABLE_SIMMETRIX="${ENABLE_SIMMETRIX}" \
             -DSIM_PARASOLID="${ENABLE_PARASOLID}"   \
	     -DSIMMETRIX_LIB_DIR="${SIMMETRIX_LIB_DIR}"  \
             -DCMAKE_VERBOSE_MAKEFILE=1 
fi
echo "${MAKEOPT}"
make "${MAKEOPT}"
make install
