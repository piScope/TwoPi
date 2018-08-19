#!/bin/bash

check_env ()
{
    if [[ ! "${TwoPiRoot}" ]]; then
        echo "TwoPiRoot is not set"
        return 0
    fi
    if [[ ! "${TwoPiDevice}" ]]; then
        echo "TwoPiDevice is not set"
        return 0
    fi
    return 1
}

_usage() {
    echo 'buildcomponent.sh -d <component> <action>'
    exit 1
}   

check_env
if [ $? == 0 ]; then
   exit
fi
mkdir -p ${TwoPiRoot}

while getopts "d" opts
do 
   case $opts in
       d) DEVMODE=1
          export TwoPiDevMode="1"
	  shift
         ;;
       h) _usage;;
         :|\?) _usage;;
   esac
done

script=$(dirname "$0")/$1_${TwoPiDevice}_$2.sh
SPATH=$(dirname "$0")

COMPONENT=$1
OPERATION=$2

shift
shift

if [ ! -f $script ]; then
   script=${SPATH}/${COMPONENT}_default_${OPERATION}.sh
fi

$script  $*
