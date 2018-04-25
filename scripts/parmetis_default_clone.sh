#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

mkdir -p $SRCDIR
cd $SRCDIR
wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/parmetis-4.0.3.tar.gz
tar -zxvf parmetis-4.0.3.tar.gz
rm parmetis-4.0.3.tar.gz

