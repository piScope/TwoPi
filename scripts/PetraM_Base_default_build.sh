#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_Base

MAKE=$(command -v make)
PYTHON=$(command -v python)
cd $REPO

$PYTHON setup.py build
$PYTHON setup.py install --prefix=${TwoPiRoot}
