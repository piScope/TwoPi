#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

MAKE=$(command -v make)
cd $REPO
cp setup_templates/setup_default.py setup.py
touch Makefile.local

MPI_ROOT=/usr/local
MPI=mpi    # eihter mpi or mpich (libmpi or libmpich)
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --mpi-root)
    MPI_ROOT=$2
    shift # past argument
    shift # past param
    ;;
    --mpi)
    MPI=$2
    shift # past argument
    shift # past param
    ;;
    --mpi-lib)
    MPI_LIB=$2
    shift # past argument
    shift # past param
    ;;
    --mpi-inc)
    MPI_INC=$2
    shift # past argument
    shift # past param
    ;;
esac
done

export MPICC=${MPICC}
export MPICXX=${MPICXX}
export MPIFC=${MPIFC}
export MPIFL=${MPIFC}
export CXX=${MPIFC}
export CC=${MPICXX}
export LDFLAGS+="-lstdc++"
#note : linker must be fortran since MUMPS need fortran FILE I/O.
#       linkflag must have -pthread, -shared for pytho shared library
#       -lstdc++ is necessary since the wrapper is c++


export USRLOCAL=${TwoPiRoot}
export MUMPS=${TwoPiRoot}/src/MUMPS_5.1.2/
export PORD=${TwoPiRoot}/src/MUMPS_5.1.2/

#MPI
export MPILIB=${MPI}
if [ -z ${MPI_INC+x} ];then
   export MPICHINCDIR=${MPI_ROOT}/include
else
   export MPICHINCDIR=${MPI_INC}
fi
if [ -z ${MPI_LIB+x} ];then
   export MPICHLNKDIR=${MPI_ROOT}/lib
else
   export MPICHLNKDIR=${MPI_LIB}
fi
#export MPICHINCDIR="/usr/local/include"
#export MPICHLNKDIR="/usr/local/lib"

$MAKE
$MAKE install
