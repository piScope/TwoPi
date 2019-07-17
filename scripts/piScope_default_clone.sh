#!/bin/bash

# load env
SCRIPT=$(dirname "$0")/env_${TwoPiDevice}.sh
source $SCRIPT

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO=${piScope_REPO}

DO_LATEST=true

# check repository branch name
OPWD=$PWD
cd $SRCDIR/$REPO
BRANCH=$($GIT rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" == "HEAD" ]; then
   BRANCH="master"
fi
cd $OPWD

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -l|--latest)
    DO_LATEST=true
    shift # past argument    
    ;;
    -b|--checkout)
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

git_clone_or_pull "https://github.com/piScope/piScope.git" $REPO $SRCDIR --checkout $BRANCH

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

