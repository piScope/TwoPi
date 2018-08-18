# This CMakeLists.txt is to find MPI.h
# This file is called from env_mpi.sh
cmake_minimum_required(VERSION 2.8.10)

project(MPI_HEADER)

find_package(MPI  REQUIRED)
file(WRITE mpi_h_loc.txt ${MPI_INCLUDE_PATH})
file(WRITE mpi_lib_loc.txt ${MPI_LIBRARY})
message("MPI_FOUND " ${MPI_FOUND})
#message("MPI_INCLUDE_PATH " ${MPI_INCLUDE_PATH})
#message("MPI_LIBRARIES " ${MPI_LIBRARY})

