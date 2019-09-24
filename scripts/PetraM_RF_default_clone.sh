#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO="PetraM_RF"

SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull "${TwoPiGit}/PetraM_RF.git" $REPO $SRCDIR $*

