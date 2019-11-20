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

# add link to gmsh.py. it seems like there is two possible locations
PYTHON=$TwoPiRoot/bin/python
PYTHONVERSION=$(${PYTHON} -c "import os;print(os.path.basename(os.path.dirname(os.__file__))[-3:])")
cd $TwoPiRoot/lib/python${PYTHONVERSION}/site-packages

if [ -L pyCore.py ] ; then
    echo "removing previous link to pyCore.py"
    rm pyCore.py
fi
if [ -e pyCore.py ]; then
    echo "(error) pyCore.py already exits under site-packages"
    exit 1
fi

if [ -f $TwoPiRoot/lib/pyCore.py ]; then
   ln -snf $TwoPiRoot/lib/pyCore.py pyCore.py
   ln -snf $TwoPiRoot/lib/_pyCore.so _pyCore.so
fi
if [ -f $TwoPiRoot/lib64/pyCore.py ]; then
   ln -snf $TwoPiRoot/lib64/pyCore.py pyCore.py
   ln -snf $TwoPiRoot/lib64/_pyCore.so _pyCore.so
fi

