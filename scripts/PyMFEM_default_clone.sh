#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO="PyMFEM"

DO_LATEST=true
BRANCH=master

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -l|--latest)
    DO_LATEST=true
    shift # past argument    
    ;;
    -b|--branch)
    BRANCH=$2
    shift # past argument    
    shift # past param
    ;;
    --sha)
    SHA=$2
    DO_LATEST=false	
    shift # past argument
    shift # past param
esac
done


SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull "https://github.com/mfem/PyMFEM.git" $REPO $SRCDIR

if [ ! -f ${SRCDIR}/${REPO} ]; then
   cd ${SRCDIR}/${REPO}
   echo "Checking out" ${BRANCH}   $DO_LATEST 
   $GIT checkout ${BRANCH} 
   if ! ${DO_LATEST} 
   then   
      echo "Checking out" ${SHA}
      $GIT checkout ${SHA}
   fi
fi
