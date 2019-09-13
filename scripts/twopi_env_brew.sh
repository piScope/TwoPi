#!/bin/bash
#
#  twopi_env_brew.sh
#
#     brew version of twopi_env
#
#       1) devicename = brew
#       2) add gmsh.py, wxpython path to PYTHONPATH
#               /usr/local/Cellar/gmsh/4.4.1/lib
#               /usr/local/opt/wxpython/libexec/lib/python3.7/site-packages/
#       3) add PATH the following
#               /usr/local/opt/llvm/bin
#               /usr/local/opt/python/libexec/bin
#       4) we don't use virtualenv, so PYTHON is python3

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
TWOPIVER=TwoPi

export TwoPiDevice=brew
export TwoPiRoot=$SC

export LD_LIBRARY_PATH=$TwoPiRoot/lib:$LD_LIBRARY_PATH
export PATH=$TwoPiRoot/bin:$PATH

export TwoPiGit=git@github.com:piScope

GMSHLIB=$(dirname $(dirname $(dirname $(which gmsh))/$(readlink $(which gmsh))))/lib
WXLIB=/usr/local/opt/wxpython/libexec/lib/python3.7/site-packages/

export PYTHONPATH=WXLIB:GMSHLIB:$PYTHONPATH

LLVMBIN=/usr/local/opt/llvm/bin
PYTHONBIN=/usr/local/opt/python/libexec/bin

export PATH=LLVMLIB:PYTHONBIN:$PATH

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
INTERPRETER=$(which python3)

alias piscope="${TwoPiRoot}/bin/piscope -e ${INTERPRETER}"

