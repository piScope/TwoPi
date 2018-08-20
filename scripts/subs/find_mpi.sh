#!/bin/bash

MYPATH=$(realpath $BASH_SOURCE)
MPILOCDIR=$(dirname "$MYPATH")/../../extra/MPI
MPILOCFILE1=$(dirname "$MYPATH")/../../extra/MPI/mpi_h_loc.txt
MPILOCFILE2=$(dirname "$MYPATH")/../../extra/MPI/mpi_lib_loc.txt

#if [ ! -f $MPILOCFILE ]; then
DD=$PWD
cd $MPILOCDIR
cmake .
cd $DD
#fi

MPI_INCLUDE_PATH=$(cat ${MPILOCFILE1})
MPI_LIBRARY_PATH=$(dirname $(cat ${MPILOCFILE2}))
echo "MPI_INCLUDE_PATH "$MPI_INCLUDE_PATH
echo "MPI_LIBRARY_PATH "$MPI_LIBRARY_PATH



