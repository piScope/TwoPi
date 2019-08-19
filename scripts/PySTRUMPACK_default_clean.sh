#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO="PySTRUMPACK"

cd ${SRCDIR}/${REPO}
make clean

