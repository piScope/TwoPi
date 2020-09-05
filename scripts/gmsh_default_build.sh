#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

_usage() {
    echo 'GMSH '
    echo '   options: --no-openmp'
    echo '   options: --with-openmp'    
}

ENABLE_OMP=0
while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    --no-openmp)
    ENABLE_OMP=0
    shift # past argument
    ;;
    --with-openmp)
    ENABLE_OMP=1
    shift # past argument
    ;;
    --help)
    _usage
    exit 1
    ;;
    *)
    echo "Unknown option " $key
    exit 2  #  error_code=2
    ;;
esac
done


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
	  -DENABLE_OPENMP=${ENABLE_OMP}       \
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
   ln -snf $TwoPiRoot/lib/gmsh.py gmsh.py
   ln -snf $TwoPiRoot/lib/libgmsh.so libgmsh.so
fi
if [ -f $TwoPiRoot/lib64/gmsh.py ]; then
   ln -snf $TwoPiRoot/lib64/gmsh.py gmsh.py
   ln -snf $TwoPiRoot/lib64/libgmsh.so libgmsh.so
fi

