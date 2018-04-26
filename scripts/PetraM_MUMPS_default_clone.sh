#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO="PetraM_MUMPS"

SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull "git@github.com:piScope/PetraM_MUMPS.git" "PetraM_MUMPS" $SRCDIR
    

