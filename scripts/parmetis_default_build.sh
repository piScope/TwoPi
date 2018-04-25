#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

script=$(dirname "$0")/env_${TwoPiDevice}.sh
source script

cd ${SRCDIR}/parmetis-4.0.3


$MAKE config shared=1 prefix=$TwoPiRoot cc=$MPICC cxx=$MPICXX
$MAKE
$MAKE install



