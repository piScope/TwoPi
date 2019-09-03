#!/bin/bash
#
#  twopi_env.sh
#     set enviromental variables to use twopi
#
#     this script assumes python exists under $TwoPiRoot/bin
#     normally this executable is made from virtualenv. but
#     it could be a link to an executable in other location.
#
#     TwoPi install all modules using prefix=$TwoPiRoot
#     python module is iinstalled in
#       $TwoPiRoot/lib/pythonA.B/site-packages
#     A.B is inferred from os.__file__

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

# we need to find lib/pythonA.B (A.B is a version number)
# we get this number from os.__file__

PYTHON=$TwoPiRoot/bin/python
PYTHONVERSION=$(${PYTHON} -c "import os;print(os.path.basename(os.path.dirname(os.__file__))[-3:])")
PYTHONLIB=$TwoPiRoot/lib/python${PYTHONVERSION}
mkdir -p $PYTHONLIB/site-packages
export PYTHONPATH=$PYTHONLIB/site-packages:$PYTHONPATH

export PetraM=$TwoPiRoot
export TwoPiGit=git@github.com:piScope

#Prompot
# Note: Change color code based on following BASH colors
#Color	Code  Black	0;30
#              Blue	0;34
#              Green	0;32
#              Cyan	0;36
#              Red	0;31
#              Purple	0;35
#              Brown	0;33
#              Blue	0;34
#              Green	0;32
#              Cyan	0;36
#              Red	0;31
#              Purple	0;35
#              Brown	0;33
PS1="("${TWOPIVER}")"
PS1="\[\e[1;32m\]"${PS1}"\[\e[0m\]"
export PS1=${PS1}"\\h:\[\e[01;34m\]\w \[\e[0m\]\u\$ "

# this is necessary to luanch piScope with proper framework enviroment
INTERPRETER=$(cat $TWOPIROOT/etc/interpreter)
export PYTHONHOME=$TWOPIROOT

alias piscope="${TwoPiRoot}/bin/piscope -e ${INTERPRETER}"

