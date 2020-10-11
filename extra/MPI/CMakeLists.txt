# This CMakeLists.txt is to find MPI.h
# This file is called from env_mpi.sh
cmake_minimum_required(VERSION 3.10.10)

project(MPI_HEADER)

find_package(MPI  REQUIRED)

# Here we assume mpi.h is found in the first path...;D
list(GET MPI_CXX_INCLUDE_DIRS 0 MPI_INC_PATH)
list(GET MPI_CXX_LIBRARIES 0 MPI_LNK_PATH)
file(WRITE mpi_h_loc.txt ${MPI_INC_PATH})
file(WRITE mpi_lib_loc.txt ${MPI_LNK_PATH})
message("MPI_INCLUDE " ${MPI_CXX_INCLUDE_DIRS})
message("MPI_FOUND " ${MPI_FOUND})
foreach(PATH ${MPI_CXX_INCLUDE_DIRS})
  MESSAGE("MPI_INCLUDE_PATH(s)" "${PATH}")
endforeach()
message("MPI_INCLUDE"    ${MPI_INC_PATH})
message("MPI_LIBRARIES " ${MPI_LNK_PATH})

