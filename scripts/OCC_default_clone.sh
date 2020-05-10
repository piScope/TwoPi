#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

mkdir -p $SRCDIR
MYPATH=$BASH_SOURCE
echo $MYPATH

OOCTGZ=$(dirname "$MYPATH")/../externals/${OCC}.tar.gz
OCCFILE=${OCC}.tar.gz
if [ ! -f ${OOCTGZ} ]; then
   OOCTGZ=$(dirname "$MYPATH")/../externals/${OCC}.tgz
   OCCFILE=${OCC}.tgz
   if [ ! -f ${OOCTGZ} ]; then
       echo "OCC source tar.gz does not exists in "$(dirname "$MYPATH")/../externals
       exit 1
   fi
fi

cd  $(dirname "$MYPATH")/../externals/
tar -zxvf ${OCCFILE} -C $SRCDIR

if [ -f ${SRCDIR}/${OCCFILE} ]; then
    rm -rf  ${SRCDIR}/${OCCFILE}
fi
