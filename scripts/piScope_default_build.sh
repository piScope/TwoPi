#!/bin/sh

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

REPO=${piScope_REPO}

# We deliberately check these two, instead of pip install numpy scipy.
# The reason is that fortran used in numpy/scipy must be comaptible
# with the one being used for PetraM.

if ! (python -c "import numpy") ; then
   echo "numpy is not found. Please install a numpy compatible with your compiler"
   exit 1
fi
if ! (python -c "import scipy") ; then
   echo "scipy is not found. Please install a numpy compatible with your compiler"
   exit 1
fi

# import all modules
pip install wxPython==4.0.3
pip install matplotlib
pip install Pillow
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


