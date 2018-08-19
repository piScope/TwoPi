#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO="PyMFEM"

DD=$PWD
cd ${SRCDIR}/${REPO}
make clean
cd $DD

