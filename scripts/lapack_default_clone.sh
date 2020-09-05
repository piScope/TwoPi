#!/bin/bash
#

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

SCRIPT_FULLPATH=$(realpath $(dirname "$0"))

SCRIPT=${SCRIPT_FULLPATH}/env_${TwoPiDevice}.sh
source $SCRIPT

mkdir -p $SRCDIR
cd $SRCDIR
#wget https://github.com/Reference-LAPACK/lapack/archive/v${LAPACK_VERSION}.tar.gz -O lapack.tar.gz
#tar -zxvf lapack.tar.gz
#rm lapack.tar.gz

DO_LATEST=false
SHA=fef53088d965582fd8cbccec8453c3bdb2371a81

REPO="lapack"
SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull "https://github.com/Reference-LAPACK/lapack.git" $REPO $SRCDIR

if [ ! -f ${SRCDIR}/${REPO} ]; then
   cd ${SRCDIR}/${REPO}
   if ! ${DO_LATEST} 
   then   
      echo "Checking out" ${SHA}
      $GIT checkout ${SHA}
   fi
fi

cd ${SRCDIR}
mv $REPO ${REPO}-${LAPACK_VERSION}

