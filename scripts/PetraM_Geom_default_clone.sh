#!/bin/sh

GIT=$(command -v git)
SRCDIR=${TwoPiRoot}/src
REPO="PetraM_Geom"

SC=$(dirname "$0")/subs/git_access.sh
source $SC

git_clone_or_pull "${TwoPiGit}/PetraM_Geom.git" $REPO $SRCDIR

## install older version of meshio and pygmsh
## we ask voropy == 0.5.0, since a newer version depends on fastfunc which
## fails on HomeBrew...

DD=$PWD
cd $SRCDIR
wget https://github.com/nschloe/meshio/archive/v1.8.17.tar.gz meshio.tar.gz
tar -zxf meshio.tar.gz
cd meshio-1.8.17 && python setup.py install --prefix=${TwoPiRoot}

pip install voropy==0.5.0

cd $SRCDIR
$GIT clone https://github.com/sshiraiwa/pygmsh.git
cd pygmsh
python setup.py build
python setup.py install --prefix=${TwoPiRoot}

cd $DD


