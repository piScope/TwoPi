#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO="PetraM_MUMPS"

source $(dirname "$0")/subs/git_access.sh
git_clone_or_pull("git@github.com:piScope/PetraM_MUMPS.git", "PetraM_MUMPS", $SRCDIR)
    

