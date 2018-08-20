#!/bin/bash

MYPATH=$(realpath $BASH_SOURCE)

LAPACKLOCDIR=$(dirname "$MYPATH")/../../extra/lapack
LOCFILE1=$(dirname "$MYPATH")/../../extra/lapack/lapack_linkg_flags.txt
LOCFILE2=$(dirname "$MYPATH")/../../extra/lapack/lapack_libs.txt


DD=$PWD
cd $LAPACKLOCDIR
cmake .
cd $DD
#fi

LAPACK_LINK_FLAGS=$(cat ${LOCFILE1})
LAPACK_LIBRARIES=$(cat ${LOCFILE2})
echo "LAPACK_LINK_FLAGS "$LAPACK_LINK_FLAGS
echo "LAPACK_LIBRARIES "$LAPACK_LIBRARIES




