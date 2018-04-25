#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

cd ${SRCDIR}/metis-5.1.0

$MAKE config shared=1 prefix=$TwoPiRoot
$MAKE
$MAKE install



