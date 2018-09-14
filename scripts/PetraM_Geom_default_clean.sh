#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_Geom
MAKE=$(command -v make)

cd $REPO

rm -rf build/*