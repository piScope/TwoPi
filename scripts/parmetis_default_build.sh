#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

cd ${SRCDIR}/parmetis-4.0.3

$MAKE config shared=1 prefix=$TwoPiRoot
$MAKE
$MAKE install



