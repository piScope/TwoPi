#!/bin/bash

echo "TEST module"


#sample argument 
#./scripts/buildcomponent.sh TEST clone -s -parallel -l /usr/lib
#./scripts/buildcomponent.sh TEST clone -s -l /usr/lib
DO_SERIAL=false
DO_PARALLEL=false
DO_DEFAULT=true
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -s|--serial)
    DO_SERIAL=true
    DO_DEFAULT=false
    shift # past argument    
    ;;
    -p|--parallel)
    DO_PARALLEL=true
    DO_DEFAULT=false	
    shift # past argument
    ;;
    -l|--lib)
    LIBPATH="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
echo "serial" $DO_SERIAL
echo "parallel" $DO_PARALLEL
echo "default" $DO_DEFAULT
echo "libpath" $LIBPATH
if $DO_SERIAL || $DO_DEFAULT ;then
    echo "doing serial"
fi
echo "positional" $POSITIONAL


