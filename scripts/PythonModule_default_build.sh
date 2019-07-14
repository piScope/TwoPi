#!/bin/bash

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

# import all modules
pip install pathlib2
pip install wxPython
pip install matplotlib
pip install Pillow
pip install hgapi
pip install PyOpenGL
pip install netCDF4
pip install PyPDF2
pip install pdfrw
pip install h5py

# mpi4py need to know mpi.h. 
export CC=${CC}
export MPICC=${MPICC}
pip install mpi4py
