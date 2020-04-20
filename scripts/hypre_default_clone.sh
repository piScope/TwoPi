#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
CMAKE_FIX_DIR=$(dirname "$0")/../extra/hypre
source $SCRIPT

ODIR=$PWD

mkdir -p $SRCDIR
cd $SRCDIR

wget https://github.com/hypre-space/hypre/archive/v${HYPRE_VERSION}.tar.gz -O hypre.tar.gz
tar -zxvf hypre.tar.gz
rm hypre.tar.gz

if [ ${HYPRE_VERSION} == "2.18.2" ]; then
    echo "Appling a fix to CMakeLists.txt"
    CMAKE_FIX=${CMAKE_FIX_DIR}/CMakeLists_2.18.2_fix.txt
    HYPREDIR=${TwoPiRoot}/src/hypre-${HYPRE_VERSION}/src/
    diff ${CMAKE_FIX} ${HYPREDIR}/CMakeLists.txt
    cp ${CMAKE_FIX} ${HYPREDIR}/CMakeLists.txt
fi
   

