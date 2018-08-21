#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_Geom
DD=$PWD

MAKE=$(command -v make)
GIT=$(command -v git)

cd $REPO

export PetraM=${TwoPiRoot}
$MAKE
$MAKE install

## install older version of pygmsh from my fork
## this one need == 0.5.0, and meshio==1.8.17, partly because fastfunc
## fails on HomeBrew...

cd $SRCDIR
$GIT clone https://github.com/sshiraiwa/pygmsh.git
cd pygmsh
python setup.py build
python setup.py install --prefix=${TwoPiRoot}

cd $DD


