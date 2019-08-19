#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_Driver
MAKE=$(command -v make)

cd $REPO

$MAKE clean

