#!/bin/bash

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SCRIPT=$(dirname "$0")/subs/ostype.sh
source $SCRIPT

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

cd ${SRCDIR}/parmetis-4.0.3
export CFLAGS="${CFLAGS} -fPIC"

$MAKE config shared=1 prefix=$TwoPiRoot cc=$MPICC cxx=$MPICXX
$MAKE $MAKEOPT
$MAKE install

OSTYPE=$(ostype)
if [ "${OSTYPE}" == "Mac" ]; then
   install_name_tool -id ${TwoPiRoot}/lib/libparmetis.dylib ${TwoPiRoot}/lib/libparmetis.dylib
fi


