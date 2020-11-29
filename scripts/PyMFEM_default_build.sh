#!/bin/bash

SCRIPT=$(dirname $BASH_SOURCE)/env_${TwoPiDevice}.sh
source $SCRIPT

_usage() {
    echo 'PyMFEM : Python Wrapper for MFEM'
    echo '   options: --parallel'
    echo '            --serial'    
    echo '            --clean-swig'
    echo '            --run-swig'
    echo '            --with-pumi'
    echo '            --pumi-prefix'
    echo '            --dry-run'        
    
}


DO_SERIAL=false
DO_PARALLEL=false
DO_DEFAULT=true
DO_SWIG=false
DO_CLEAN_SWIG=false
DRY_RUN=''

PUMI_PREFIX=""
ENBLE_PUMI=""

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    --dry-run)
    DRY_RUN="--dry-run"
    shift # past argument    	
    ;;
    --clean-swig)
    DO_CLEAN_SWIG=true
    shift # past argument    
    ;;
    --run-swig)
    DO_SWIG=true
    shift # past argument    
    ;;
    -s|--serial)
    DO_SERIAL=true
    DO_DEFAULT=false
    shift # past argument    
    ;;
    -p|--parallel)
    DO_PARALLEL=true
    DO_DEFAULT=false
    shift # past argument
    ;;
    --with-pumi)
    ENABLE_PUMI="--with-pumi"
    shift # past argument
    ;;
    --pumi-prefix)
    ENABLE_PUMI=yes
    PUMI_PREFIX="--pumi-prefix="$2
    shift # past argument    
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

### 
# set MPI and Booost related variable (This should happen before cd below)
#source $(dirname $BASH_SOURCE)/subs/find_boost.sh
#source $(dirname $BASH_SOURCE)/subs/find_mpi.sh
###

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PyMFEM
cd $REPO

export CC=${CC}
export CXX=${CXX}
export MPICC=${MPICC}
export MPICXX=${MPICXX}
export CXX11FLAG=$CXX11FLAG

if $DO_CLEAN_SWIG ;then
    python setup.py clean --swig $DRY_RUN
    exit 0
fi

if $DO_SWIG ;then
    python setup.py install --swig               \
	   --with-parallel                       \
           --mfem-prefix=${TwoPiRoot}/mfem       \
           --mfemp-prefix=${TwoPiRoot}/mfem/par  \
           --mfems-prefix=${TwoPiRoot}/mfem/ser  \
           $DRY_RUN
    
    exit 0
fi

if $DO_SERIAL;then
    python setup.py install                      \
	   --mfem-prefix-no-swig                 \
           --mfem-prefix=${TwoPiRoot}/mfem       \
           --mfemp-prefix=${TwoPiRoot}/mfem/par  \
           --mfems-prefix=${TwoPiRoot}/mfem/ser  \
	   $DRY_RUN
fi

if $DO_PARALLEL ;then
    python setup.py install                             \
           --mfem-prefix-no-swig                        \
           --no-serial                                  \
           --with-parallel                              \
           --mfem-prefix=${TwoPiRoot}/mfem              \
           --mfemp-prefix=${TwoPiRoot}/mfem/par         \
           --mfems-prefix=${TwoPiRoot}/mfem/ser         \
	   --hypre-prefix=${TwoPiRoot}                  \
	   --metis-prefix=${TwoPiRoot}                  \
	   $ENABLE_PUMI $PUMI_PREFIX                    \
	   $DRY_RUN	   
fi

if $DO_DEFAULT ;then
    python setup.py install                             \
           --mfem-prefix-no-swig                        \
           --with-parallel                              \
           --mfem-prefix=${TwoPiRoot}/mfem              \
           --mfemp-prefix=${TwoPiRoot}/mfem/par         \
           --mfems-prefix=${TwoPiRoot}/mfem/ser         \
	   --hypre-prefix=${TwoPiRoot}                  \
	   --metis-prefix=${TwoPiRoot}                  \
	   $ENABLE_PUMI $PUMI_PREFIX                    \
	   $DRY_RUN	   	   
fi


