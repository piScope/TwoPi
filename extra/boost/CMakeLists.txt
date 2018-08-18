# This CMakeLists.txt is to find MPI.h
# This file is called from env_mpi.sh
cmake_minimum_required(VERSION 2.8.10)

project(BOOST_HEADER)

find_package(Boost  REQUIRED)
file(WRITE boost_h_loc.txt   ${Boost_INCLUDE_DIRS})
file(WRITE boost_lib_loc.txt ${Boost_LIBRARY_DIRS})
message("Boost_FOUND " ${Boost_FOUND})
#message("Boost_INCLUDE_DIRS " ${Boost_INCLUDE_DIRS})
#message("Boost_LIBRARY_DIRS " ${Boost_LIBRARY_DIRS})

