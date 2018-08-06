#!/bin/sh

MYPATH=$(realpath "$0")

MPILOCDIR=$(dirname "$MYPATH")/../extra/MPI
MPILOCFILE=$(dirname "$MYPATH")/../extra/MPI/mpi_h_loc.txt

if [ ! -f $MPILOCFILE ]; then
    cd $MPILOCDIR
    cmake .
fi

MPI_INCLUDE_PATH=$(cat mpi_h_loc.txt)



