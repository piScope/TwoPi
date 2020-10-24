#!/bin/bash
if [ -z ${MPI_INCLUDE_PATH+x} ]; then
   MYPATH=$BASH_SOURCE
   MPILOCDIR=$(dirname "$MYPATH")/../../extra/MPI
   MPILOCFILE1=$(dirname "$MYPATH")/../../extra/MPI/mpi_h_loc.txt
   MPILOCFILE2=$(dirname "$MYPATH")/../../extra/MPI/mpi_lib_loc.txt
 
   #if [ ! -f $MPILOCFILE ]; then
   DD=$PWD
   cd $MPILOCDIR
   rm -f CMakeCache.txt
   cmake . -DCMAKE_CXX_COMPILER=$CXX \
	 -DCMAKE_C_COMPILER=$CC \
	 -DMPI_CXX_COMPILER=$MPICXX \
         -DMPI_C_COMPILER=$MPICC
   cd $DD
   #fi

   MPI_INCLUDE_PATH=$(cat ${MPILOCFILE1})
   MPI_LIBRARY_PATH=$(dirname $(cat ${MPILOCFILE2}))
   echo "MPI_INCLUDE_PATH "$MPI_INCLUDE_PATH
   echo "MPI_LIBRARY_PATH "$MPI_LIBRARY_PATH
fi
if [ -z ${MPI_LIBRARY_PATH+x} ]; then
    echo "Error"
    echo "MPI_LIBRARY_PATH is not set"
    exit 1
fi



