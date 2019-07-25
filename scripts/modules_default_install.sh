#!/bin/bash

#
#  install everything
#  (usage)  bin/twopi install modules --PyMFEM-branch MFEM4_dev --PetraM-Repo git@github.mit.edu:piScope --piScope-branch py37_prep2 -PetraM-branch MFEM4_dev --log-dir $HOME/logs
#
#
GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

TWOPI=$(dirname "$0")/../bin/twopi

PETRAM_REPO = $TwoPiGit
PYMFEM_BRANCH = master
PETRAM_BRANCH = master
PISCOPE_BRANCH = master
LOG_DIR = $HOME/TwoPiInstallLog

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
    --piScope-branch)
    PISCOPE_BRANCH = $2
    shift # past param    
    shift # past argument
    ;;
    --PetraM-branch)
    PETRAM_BRANCH = $2
    shift # past param    
    shift # past argument
    ;;
    --log-dir)
    LOG_DIR = $2
    shift # past param    
    shift # past argument
    ;;
esac
done

mkdir -p $LOG_DIR
echo "Installing PythonModules"
$TWOPI install PythonModule > $LOGDIR/PythonModule.log 2>&1

echo "Installing piScope ("branch="${PISCOPWE_BRANCH}")"
$TWOPI install piScope --checkout ${PISCOPe_BRANCH}  > $LOGDIR/piScope.log 2>&1

echo "Installing OOC"
$TWOPI install OCC        > $LOGDIR/OCC.log 2>&1

echo "Installing gmsh"
$TWOPI install gmsh       > $LOGDIR/gmsh.log 2>&1

echo "Installing hypre"
$TWOPI install hypre      > $LOGDIR/hypre.log 2>&1

echo "Installing metis"
$TWOPI install metis      > $LOGDIR/metis.log 2>&1

echo "Installing parmetis"
$TWOPI install parmetis   > $LOGDIR/parmetis.log 2>&1

echo "Installing MUMPS"
$TWOPI install MUMPS      > $LOGDIR/MUMPS.log 2>&1

echo "Downloading MFEM"
$TWOPI clone mfem         > $LOGDIR/mfem_clone.log 2>&1

echo "Installing MFEM (serial)"
$TWOPI build mfems        > $LOGDIR/mfems.log 2>&1

echo "Installing MFEM (parallel)"
$TWOPI build mfemp        > $LOGDIR/mfemp.log 2>&1


echo "Installing PyMFEM (branch = "${PYMFEM_BRANCH}")"
$TWOPI clone PyMFEM       
cd $TwoPiRoot/PyMFEM;$GIT checkout $PYMFEM_BRANCH;cd -
$TWOPI build PyMFEM       > $LOGDIR/PyMFEM.log 2>&1


echo "Installing PetraM Modules (repo = "${TwoPiGit}", branch="${PETRAM_BRANCH}")"
export TwoPiGit=$PETRAM_REPO
echo "PetraM_Base"
$TWOPI clone PetraM_Base --checkout ${PETRAM_BRANCH}  > $LOGDIR/PetraM_Base.log 2>&1

echo "PetraM_Geom"
$TWOPI clone PetraM_Geom --checkout ${PETRAM_BRANCH}  > $LOGDIR/PetraM_Geom.log 2>&1

echo "PetraM_RF"
$TWOPI clone PetraM_RF --checkout ${PETRAM_BRANCH}    > $LOGDIR/PetraM_RF.log 2>&1

echo "PetraM_MUMPS"
$TWOPI clone PetraM_MUMPS   > $LOGDIR/PetraM_MUMPS.log 2>&1


