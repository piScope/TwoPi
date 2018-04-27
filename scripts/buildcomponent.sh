#!/bin/sh

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
check_env
if [ $? == 0 ]; then
   exit
fi

script=$(dirname "$0")/$1_${TwoPiDevice}_$2.sh
SPATH=$(dirname "$0")
COMPONENT=$1
OPRATION=$2

shift
shift

if [ ! -f $script ]; then
   script=$SPATH/$COMPONENT_default_$OPERATION.sh
fi

$script  $*
