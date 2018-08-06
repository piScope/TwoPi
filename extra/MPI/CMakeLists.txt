# This CMakeLists.txt is to find MPI.h
cmake_minimum_required(VERSION 2.8.10)

project(MPI_HEADER)

find_package(MPI  REQUIRED)
file(WRITE mpi_h_loc.txt ${MPI_INCLUDE_PATH})
message("MPI_FOUND " ${MPI_FOUND})
message("MPI_INCLUDE_PATH " ${MPI_INCLUDE_PATH})

