#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

mkdir -p $SRCDIR
cd $SRCDIR
wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz
tar -zxvf metis-5.1.0.tar.gz
rm metis-5.1.0.tar.gz

