#!/bin/bash

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src

mkdir -p $SRCDIR
cd $SRCDIR
git clone clone https://github.com/SCOREC/core.git pumi



