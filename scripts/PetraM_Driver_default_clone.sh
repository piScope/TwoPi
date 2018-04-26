#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO="PetraM_MUMPS"

SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull "git@github.com:piScope/PetraM_Driver.git" "PetraM_Driver" $SRCDIR
    

