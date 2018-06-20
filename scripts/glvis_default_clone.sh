#!/bin/sh

GIT=$(command -v git)
REPO="glvis"
SRCDIR=${TwoPiRoot}/src

SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull "https://github.com/glvis/glvis.git" $REPO $SRCDIR




