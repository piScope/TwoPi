# This CMakeLists.txt is to find MPI.h
# This file is called from env_mpi.sh
cmake_minimum_required(VERSION 2.8.10)

project(LAPACK_HEADER)

find_package(LAPACK  REQUIRED)
file(WRITE lapack_link_flags.txt ${LAPACK_LINKER_FLAGS})
file(WRITE lapack_libs.txt ${LAPACK_LIBRARIES})
message("LAPACK_FOUND " ${LAPACK_FOUND})


