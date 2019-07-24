#!/bin/bash

#
#  install everything
#  (usage)  bin/twopi install modules --PyMFEM-branch MFEM4_dev --PetraM-Repo git@github.mit.edu:piScope 
#
#
GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

TWOPI=$(dirname "$0")/../bin/twopi

PETRAM_REPO = $TwoPiGit
PYMFEM_BRANCH = master
DO_PARALLEL=false
DO_DEFAULT=true
BOOST_ROOT=/usr/local
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --PetraM-Repo)
    PETRAM_REPO=$2	
    shift # past argument
    shift # past param    
    ;;
    --PyMFEM-branch)
    PYMFEM_BRANCH = $2
    shift # past param    
    shift # past argument
    ;;
esac
done

$TWOPI build PythonModule
$TWOPI install piScope
$TWOPI install OCC
$TWOPI install gmsh   
$TWOPI install hypre
$TWOPI install metis
$TWOPI install parmetis
$TWOPI install MUMPS   
$TWOPI clone mfem
$TWOPI build mfems
$TWOPI build mfemp

$TWOPI clone PyMFEM
cd $TwoPiRoot/PyMFEM;$GIT checkout $PYMFEM_BRANCH;cd -
$TWOPI build PyMFEM

export TwoPiGit=$PETRAM_REPO
$TWOPI clone PetraM_Base
$TWOPI clone PetraM_Geom
$TWOPI clone PetraM_MUMPS
$TWOPI clone PetraM_RF
$TWOPI clone PetraM_Driver   
