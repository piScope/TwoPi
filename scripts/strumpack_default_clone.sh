#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

mkdir -p $SRCDIR
cd $SRCDIR
wget https://gforge.inria.fr/frs/download.php/file/37622/scotch_6.0.6.tar.gz
tar -zxvf scotch_6.0.6.tar.gz
rm scotch_6.0.6.tar.gz

