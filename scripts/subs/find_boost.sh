#!/bin/bash

if [ -z ${BOOST_INCLUDE_PATH+x} ]; then
   MYPATH=$BASH_SOURCE

   BOOSTLOCDIR=$(dirname "$MYPATH")/../../extra/boost
   BOOSTLOCFILE1=$(dirname "$MYPATH")/../../extra/boost/boost_h_loc.txt
   BOOSTLOCFILE2=$(dirname "$MYPATH")/../../extra/boost/boost_lib_loc.txt

   DD=$PWD
   cd $BOOSTLOCDIR
   rm -f CMakeCache.txt
   cmake .
   cd $DD

   BOOST_INCLUDE_PATH=$(cat ${BOOSTLOCFILE1})
   BOOST_LIBRARY_PATH=$(cat ${BOOSTLOCFILE2})
   echo "BOOST_INCLUDE_PATH "$BOOST_INCLUDE_PATH
   echo "BOOST_LIBRARY_PATH "$BOOST_LIBRARY_PATH
fi
if [ -z ${BOOST_LIBRARY_PATH+x} ]; then
    echo "Error"
    echo "BOOST_LIBRARY_PATH is not set"
    exit 1
fi    

