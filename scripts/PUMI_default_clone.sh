#!/bin/bash

REPO="PUMI"
SRCDIR=${TwoPiRoot}/src
SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull https://github.com/SCOREC/core.git $REPO $SRCDIR




