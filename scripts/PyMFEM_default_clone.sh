#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO="PyMFEM"

SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull "https://github.com/sshiraiwa/PyMFEM.git" $REPO $SRCDIR
