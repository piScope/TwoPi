#!/bin/bash

if [ -z ${LAPACK_INCLUDE_PATH+x} ]; then
   MYPATH=$(realpath $BASH_SOURCE)

   LAPACKLOCDIR=$(dirname "$MYPATH")/../../extra/lapack
   LOCFILE1=$(dirname "$MYPATH")/../../extra/lapack/lapack_link_flags.txt
   LOCFILE2=$(dirname "$MYPATH")/../../extra/lapack/lapack_libs.txt


   DD=$PWD
   cd $LAPACKLOCDIR
   cmake .
   cd $DD
   #fi

   LAPACK_INCLUDE_PATH=$(cat ${LOCFILE1})
   LAPACK_LIBRARY_PATH=$(cat ${LOCFILE2})
   echo "LAPACK_INCLUDE_PATH "$LAPACK_INCLUDE_PATH
   echo "LAPACK_LIBRARY_PATH "$LAPACK_LIBRARY_PATH
fi
if [ -z ${LAPACK_LIBRARY_PATH+x} ]; then
    echo "Error"
    echo "LAPACK_LIBRARY_PATH is not set"
    exit 1
fi    





