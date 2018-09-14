#!/bin/bash

SRCDIR=${TwoPiRoot}/src
REPO="PetraM_MUMPS"
SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull "${TwoPiGit}/PetraM_MUMPS.git" $REPO $SRCDIR

    

