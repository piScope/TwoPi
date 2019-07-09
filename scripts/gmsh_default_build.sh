#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=$SRCDIR/${GMSH}-source
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

mkdir -p $REPO/cmbuild
cd $REPO/cmbuild
$CMAKE .. -DCMAKE_INSTALL_PREFIX=${TwoPiRoot} \
          -DCMAKE_INSTALL_RPATH=${TwoPiRoot}  \
          -DCMAKE_C_COMPILER=${CC}            \
          -DCMAKE_CXX_COMPILER=${CXX}         \
          -DENABLE_BUILD_DYNAMIC=1            \
	  -DENABLE_OS_SPECIFIC_INSTALL=0      \
          -DENABLE_WRAP_PYTHON=1              \
          -DENABLE_BUILD_SHARED=1             \
          -DCMAKE_INSTALL_NAME_DIR=${TwoPiRoot}/lib 

$MAKE VERBOSE=1 $MAKEOPT
$MAKE install

# add link to gmsh.py. it seems like there is two possible locations
PYTHON=$TwoPiRoot/bin/python
PYTHONVERSION=$(${PYTHON} -c "import os;print(os.path.basename(os.path.dirname(os.__file__))[-3:])")
cd $TwoPiRoot/lib/python${PYTHONVERSION}/site-packages

if [ -L gmsh.py ] ; then
    echo "removing previous link to gmsh.py"
    rm gmsh.py
fi
if [ -e gmsh.py ]; then
    echo "(error) gmsh.py already exits under site-packages"
    exit 1
fi

if [ -f $TwoPiRoot/lib/gmsh.py ]; then
   ln -s $TwoPiRoot/lib/gmsh.py gmsh.py
   ln -s $TwoPiRoot/lib/libgmsh.so libgmsh.so
fi
if [ -f $TwoPiRoot/lib64/gmsh.py ]; then
   ln -s $TwoPiRoot/lib64/gmsh.py gmsh.py
   ln -s $TwoPiRoot/lib64/libgmsh.so libgmsh.so
fi

