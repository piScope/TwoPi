#!/bin/bash

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

NO_WX=0
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --no-wx)
    NO_WX=1
    shift # past param    
    ;;
    *)
    echo "Unknown option " $key
    exit 2  #  error_code=2
    ;;
esac
done

echo "NO_WX "$NO_WX
# import all modules
pip install pathlib2
if [[ "$NO_WX" -eq "0" ]]; then
    pip install wxPython
else 
    echo "skiping wxPython"
fi 
pip install matplotlib
pip install Pillow
pip install hgapi
pip install PyOpenGL
pip install netCDF4
pip install PyPDF2
pip install pdfrw
pip install future
pip install h5py

# mpi4py need to know mpi.h. 
export CC=${CC}
export MPICC=${MPICC}
pip install mpi4py
