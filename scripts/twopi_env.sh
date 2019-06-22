#!/bin/bash

function ostype() {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=Mac;;
        CYGWIN*)    machine=Cygwin;;
        MINGW*)     machine=MinGw;;
        *)          machine="UNKNOWN:${unameOut}"
    esac
    echo ${machine}
}
function safe_realpath() {
   OSTYPE=$(ostype)  
   if [ -x "$(command -v realpath)" ]; then
      #echo "realpath found !"
      realpath $1
      return
   fi
   if [ "$OSTYPE" == "Mac" ]; then
      # we dont try readlink in Mac since it is different 
      # readlink (BSD) used in Linuxxa
      echo "realpath is not avaialbe emulating it with python (Mac)"
      python -c 'import os,sys;print(os.path.realpath("'"$1"'"))'
      exit 0
   fi
   if [ -x "$(command -v readlink)" ]; then
      #echo "Using readlink"
      readlink -f $1
      return
   fi
   # I am not sure if it comes to this fallback...
   echo "realpath is not avaialbe emulating it with python"
   python -c 'import os,sys;print(os.path.realpath("'"$1"'"))'
}

SC="$(safe_realpath  "$BASH_SOURCE")"
SC="$(dirname $SC)"
SC="$(dirname $SC)"

TWOPIROOT=$SC
TWOPIVER=$(basename $SC)
TWOPIDEVICE=$(cat $TWOPIROOT/etc/devicename)

export TwoPiDevice=$TWOPIDEVICE
export TwoPiRoot=$TWOPIROOT

export LD_LIBRARY_PATH=$TwoPiRoot/lib:$LD_LIBRARY_PATH
export PATH=$TwoPiRoot/bin:$PATH

# this will find lib/pythonA.B (A.B is a version number)

PYTHONLIB=$(find $TwoPiRoot/lib -name "python*")
export PYTHONPATH=$PYTHONLIB/site-packages:$PYTHONPATH

export PetraM=$TwoPiRoot
export TwoPiGit=git@github.com:piScope

export PS1="("${TWOPIVER}")\\h:\\W \\u$ "

