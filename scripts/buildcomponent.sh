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

if [ ! -f $script ]; then
   script=$(dirname "$0")/$1_default_$2.sh
fi

$script
