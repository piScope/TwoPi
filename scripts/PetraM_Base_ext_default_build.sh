#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_Base_ext
MAKE=$(command -v make)

cd $REPO

export PetraM=${TwoPiRoot}
$MAKE PREFIX=${TwoPiRoot}

###
### $MAKE all PREFIX=${TwoPiRoot}


