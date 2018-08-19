#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_RF
MAKE=$(command -v make)

cd $REPO

export PetraM=${TwoPiRoot}
$MAKE
$MAKE install
