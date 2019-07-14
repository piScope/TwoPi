#!/bin/bash

REPO="PetraM_Driver"
SRCDIR=${TwoPiRoot}/src
SC=$(dirname "$0")/subs/git_access.sh
source $SC

TwoPiGit=git@github.mit.edu:shiraiwa
git_clone_or_pull "${TwoPiGit}/PetraM_Driver.git" $REPO $SRCDIR


    

