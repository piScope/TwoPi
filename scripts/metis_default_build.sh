#!/bin/bash
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

SCRIPT=$(dirname "$0")/subs/ostype.sh
source $SCRIPT

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

cd ${SRCDIR}/metis-5.1.0

#
# SUPPORT 64BIT
#
$MAKE config shared=1 prefix=$TwoPiRoot cc=${CC}
$MAKE $MAKEOPT
$MAKE install

OSTYPE=$(ostype)
if [ "${OSTYPE}" == "Mac" ]; then
   install_name_tool -id ${TwoPiRoot}/lib/libmetis.dylib ${TwoPiRoot}/lib/libmetis.dylib
fi



