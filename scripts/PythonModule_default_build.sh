#!/bin/bash

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

NO_WX=0
FR=""
NB=""
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --no-wx)
    NO_WX=1
    shift # past param    
    ;;
    --force-reinstall)
    FR=--force-reinstall
    shift # past param    
    ;;
    --no-binary)
    NB=--no-binary
    shift # past param    
    ;;
    *)
    echo "Unknown option " $key
    exit 2  #  error_code=2
    ;;
esac
done

echo "NO_WX "$NO_WX
echo "NB "$NB
echo "FR "$FR
# import all modules
pip install pathlib2
if [[ "$NO_WX" -eq "0" ]]; then
    pip install wxPython
else 
    echo "skiping wxPython"
fi 
pip install $FR $NB matplotlib
pip install $FR $NB Pillow
pip install $FR $NB hgapi
pip install $FR $NB PyOpenGL
pip install $FR $NB netCDF4
pip install $FR $NB PyPDF2
pip install $FR $NB pdfrw
pip install $FR $NB future
pip install $FR $NB h5py

# mpi4py need to know mpi.h. 
export CC=${CC}
export MPICC=${MPICC}
pip install $FR $NB mpi4py
