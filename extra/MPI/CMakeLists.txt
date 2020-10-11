# This CMakeLists.txt is to find mpi.h
# This file is called from env_mpi.sh
cmake_minimum_required(VERSION 3.10.10)

project(MPI_HEADER)

find_package(MPI  REQUIRED)

message("MPI_FOUND " ${MPI_FOUND})

list(GET MPI_CXX_LIBRARIES 0 MPI_LNK_PATH)
file(WRITE mpi_lib_loc.txt ${MPI_LNK_PATH})

# clear file
file(WRITE mpi_h_loc.txt "") 

foreach(PATH ${MPI_CXX_INCLUDE_DIRS})
  #MESSAGE("MPI_INCLUDE_PATH(s) " "${PATH}")
  if (EXISTS "${PATH}/mpi.h")
    MESSAGE("mpi.h found in  " "${PATH}")    
    file(APPEND mpi_h_loc.txt ${PATH})
  endif()
endforeach()

message("MPI_LIBRARIES " ${MPI_LNK_PATH})

