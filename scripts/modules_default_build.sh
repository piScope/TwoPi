#!/bin/bash
#
#  install everything
#  (usage)  bin/twopi install modules --PyMFEM-branch MFEM4_dev --PetraM-Repo git@github.mit.edu:piScope --piScope-branch py37_prep2 --PetraM-branch MFEM4_dev --no-wx --no-occ-gmsh -log-dir $HOME/logs
#
#
_usage() {
    echo 'modeuls : install various moduels'
    echo '   options: --PyMFEM-branch'
    echo '            --PetraM-Repo'    
    echo '            --piScope-branch'
    echo '            --PetraM-branch'
    echo '            --no-wx'
    echo '            --no-occ-gmsh'
    echo '            --log-dir'
}

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
CMAKE=$(command -v cmake)
MAKE=$(command -v make)

TWOPI=$(dirname "$0")/../bin/twopi

PETRAM_REPO=$TwoPiGit
PYMFEM_BRANCH=master
PETRAM_BRANCH=master
PISCOPE_BRANCH=master
NO_WX=""
NO_PYTHON_MOD=0
NO_OCC_GMSH=0
LOGDIR=$HOME/TwoPiInstallLog

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
    PYMFEM_BRANCH=$2
    shift # past param    
    shift # past argument
    ;;
    --piScope-branch)
    PISCOPE_BRANCH=$2
    shift # past param    
    shift # past argument
    ;;
    --PetraM-branch)
    PETRAM_BRANCH=$2
    shift # past param    
    shift # past argument
    ;;
    --log-dir)
    LOGDIR=$2
    shift # past param    
    shift # past argument
    ;;
    --no-wx)
    NO_WX="--no-wx"
    shift # past param    
    ;;
    --no-python_mod)
    NO_PYTHON_MOD=1
    shift # past param    
    ;;
    --no-occ-gmsh)
    NO_OCC_GMSH=1
    shift # past param    
    ;;
    --help)
    _usage
    exit 1
    ;;
    *)
    echo "Unknown option " $key
    exit 2  #  error_code=2
    ;;
esac
done

mkdir -p $LOGDIR

### debug adjustment...move manually "fi" to skip somesteps  ;D
SKIPTHIS=0
if [[ "$SKIPTHIS" -ne "0" ]]; then
    echo ""
fi

if [[ "$NO_PYTHON_MOD" -eq "0" ]]; then
   echo Installing PythonModules ${NO_WX}
   $TWOPI install PythonModule ${NO_WX} | tee $LOGDIR/PythonModule.log
else 
    echo skiping all python modules
fi

echo Installing piScope :branch= "${PISCOPE_BRANCH}" 
$TWOPI clone piScope --checkout ${PISCOPE_BRANCH}  > $LOGDIR/piScope_clone.log 2>&1
$TWOPI build piScope  > $LOGDIR/piScope_build.log 2>&1

if [[ "$NO_OCC_GMSH" -eq "0" ]]; then
    echo Installing OCC
    $TWOPI install OCC        | tee $LOGDIR/OCC.log

    echo Installing gmsh
    $TWOPI install gmsh       | tee $LOGDIR/gmsh.log 
else 
    echo skiping OOC/gmsh
fi

echo Installing hypre
$TWOPI install hypre      | tee $LOGDIR/hypre.log

echo Installing metis
$TWOPI install metis      | tee $LOGDIR/metis.log

echo Installing parmetis
$TWOPI install parmetis   | tee $LOGDIR/parmetis.log 

echo Installing MUMPS
$TWOPI install-noclean MUMPS      | tee $LOGDIR/MUMPS.log 

echo Downloading MFEM
$TWOPI clone mfem         | tee  $LOGDIR/mfem_clone.log 

echo "Installing MFEM (serial)"
$TWOPI build mfems        | tee  $LOGDIR/mfems.log

echo "Installing MFEM (parallel)"
$TWOPI build mfemp        | tee  $LOGDIR/mfemp.log 


echo Installing PyMFEM :branch ="${PYMFEM_BRANCH}"
$TWOPI clone PyMFEM       
cd $TwoPiRoot/src/PyMFEM;$GIT checkout $PYMFEM_BRANCH;cd -
$TWOPI build PyMFEM       | tee $LOGDIR/PyMFEM.log 

echo Installing PetraM Modules :repo = "${TwoPiGit}", branch="${PETRAM_BRANCH}"
export TwoPiGit=$PETRAM_REPO
echo PetraM_Base
$TWOPI clone PetraM_Base --checkout ${PETRAM_BRANCH}  | tee $LOGDIR/PetraM_Base.log
$TWOPI build PetraM_Base

echo PetraM_Geom
$TWOPI clone PetraM_Geom --checkout ${PETRAM_BRANCH}  | tee $LOGDIR/PetraM_Geom.log
$TWOPI build PetraM_Geom

echo PetraM_RF
$TWOPI clone PetraM_RF --checkout ${PETRAM_BRANCH}    | tee $LOGDIR/PetraM_RF.log 
$TWOPI build PetraM_RF

echo PetraM_MUMPS
$TWOPI clone PetraM_MUMPS   |tee $LOGDIR/PetraM_MUMPS.log 2>&1
$TWOPI build PetraM_MUMPS
