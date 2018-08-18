#!/bin/sh

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

REPO=${piScope_REPO}

# import all modules
pip install wxPython==4.0.3
pip install matplotlib
pip install Pillow
pip install scipy
pip install hgapi
pip install PyOpenGL
pip install netCDF4
pip install PyPDF2
pip install pdfrw
pip install h5py
pip install mpi4py

REPO=${piScope_REPO}

LINK=${TwoPiRoot}/bin/piscope
mkdir -p ${TwoPiRoot}/bin
rm -f -- ${LINK}
ln -s  ${TwoPiRoot}/src/${REPO}/bin/piscope.sh  ${LINK}


