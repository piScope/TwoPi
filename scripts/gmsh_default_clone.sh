#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

cd  $SRCDIR
wget http://gmsh.info/src/gmsh-3.0.6-source.tgz
tar xfz gmsh-3.0.6-source.tgz
rm gmsh-3.0.6-source.tgz



