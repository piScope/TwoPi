#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PUMI/python_wrappers
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd $REPO
mkdir -p cmbuild
cd $REPO/cmbuild

export PetraM=${TwoPiRoot}

ENABLE_SIMMETRIX=OFF

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    --with-simmetrix)
    ENABLE_SIMMETRIX=ON
    shift # past argument    
    ;;
    *)
    echo "Unknown option " $key
    exit 2  #  error_code=2
    ;;
esac
done

cmake .. \
  -DSCOREC_PREFIX="${TwoPiRoot}" \
  -DCMAKE_INSTALL_PREFIX="${TwoPiRoot}" \
  -DCMAKE_C_COMPILER="${MPICC}" \
  -DCMAKE_CXX_COMPILER="${MPICXX}" \
  -DENABLE_SIMX="${ENABLE_SIMMETRIX}" \
  -DSIM_MPI=mpich3.3 \
  -DENABLE_PYTHON=ON
make 
make install
