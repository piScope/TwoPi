#!/bin/sh

GIT=$(command -v git)
REPO="mfem-git"
SRCDIR=${TwoPiRoot}/src

SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull "https://github.com/mfem/mfem.git" $REPO $SRCDIR

if [ ! -f ${SRCDIR}/${REPO} ]; then
   cd ${SRCDIR}/${REPO}
   $GIT checkout 0715efbaf95990a4e76380ac69337096b1cd347d
fi



