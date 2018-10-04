# This CMakeLists.txt is to find MPI.h
# This file is called from env_mpi.sh
cmake_minimum_required(VERSION 2.8.10)

project(MPI_HEADER)

find_package(MPI  REQUIRED)

# Here we assume mpi.h is found in the first path...;D
list(GET MPI_INCLUDE_PATH 0 MPI_INC_PATH)
file(WRITE mpi_h_loc.txt ${MPI_INC_PATH})
file(WRITE mpi_lib_loc.txt ${MPI_LIBRARY})
message("MPI_FOUND " ${MPI_FOUND})
foreach(PATH ${MPI_INCLUDE_PATH})
  MESSAGE("MPI_INCLUDE_PATH(s)" "${PATH}")
endforeach()
message("MPI_LIBRARIES " ${MPI_LIBRARY})

