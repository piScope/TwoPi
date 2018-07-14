#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_TH
MAKE=$(command -v make)

cd $REPO


export PetraM=${TwoPiRoot}
$MAKE
$MAKE install

