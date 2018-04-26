#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_MUMPS

TWOPILIB=${TwoPiRoot}/lib
TWOPIINC=${TwoPiRoot}/include

MAKE=$(command -v make)
cd $REPO
touch Makefile.local

export USRLOCAL=${TwoPiRoot}
export MUMPS=${TwoPiRoot}/src/MUMPS_5.1.2/
export PORD=${TwoPiRoot}/src/MUMPS_5.1.2/

#MPI
export MPICHINCDIR="/usr/local/include"
export MPICHLNKDIR="/usr/local/lib"

python setup.py build
python setup.py install --prefix=${TwoPiRoot}
