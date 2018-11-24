#!/bin/bash
#
# default action is to get mfem-3.4 
#
#   ./script/buildcomponent.sh mfem clone (# master mfem 3.4)
#   ./script/buildcomponent.sh mfem clone -l (# master latest)
#   ./script/buildcomponent.sh mfem clone -b test -l latest (# test branch latest)
#   

MYPATH=$BASH_SOURCE
source $(dirname "$MYPATH")/mfem_default_clone.sh



