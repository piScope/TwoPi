#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

echo "loaded" $SCRIPT
echo $MPICC

WDIR=${SRCDIR}/mpi4py

mkdir -p ${WDIR}
cd ${WDIR}

pip3 download --no-binary=:all: --dest . mpi4py==3.0.3

tar -zxvf mpi4py-3.0.3.tar.gz
#cd mpi4py-3.0.3.tar.gz

MPICC_FLAG=${MPICC} "-shared"
echo ${MPICC_FLAG}

cd mpi4py-3.0.3

python setup.py build --mpicc="${MPICC_FLAG}"
python setup.py install --prefix=${TwoPiRoot}
