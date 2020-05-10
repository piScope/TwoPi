#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

mkdir -p $SRCDIR
MYPATH=$BASH_SOURCE
echo $MYPATH

OOCTGZ=$(dirname "$MYPATH")/../externals/${OCC}.tar.gz
if [ ! -f ${OOCTGZ} ];
   OOCTGZ=$(dirname "$MYPATH")/../externals/${OCC}.tgz
   if [ ! -f ${OOCTGZ} ];   
       echo "OCC source tar.gz does not exists in "$(dirname "$MYPATH")/../externals
       exit 1
   fi
fi

cp $OOCTGZ $SRCDIR
cd  $SRCDIR
tar -zxvf ${OCC}.tar.gz
rm -rf $SRCDIR/${OCC}.tar.gz
