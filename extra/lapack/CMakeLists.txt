# This CMakeLists.txt is to find lapack
# This file is called from env_lapack.sh
# This file is not completed, not used yet...
cmake_minimum_required(VERSION 2.8.10)

project(LAPACK_HEADER)

find_package(LAPACK  REQUIRED)
if (${LAPACK_FOUND})
   foreach(LIB ${LAPACK_LIBRARIES})
       get_filename_component(LIB_PATH ${LIB} DIRECTORY)
       MESSAGE("${LIB_PATH}")
   endforeach()
else()
   file(WRITE lapack_link_flags.txt "")
   file(WRITE lapack_libs.txt "")
endif()
message("LAPACK_FOUND " ${LAPACK_FOUND})


 
