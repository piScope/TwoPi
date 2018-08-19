#!/bin/bash

MYPATH=$(realpath "$0")
TWOPI=$(dirname "$MYPATH")/twopi

$TWOPI install  piScope
$TWOPI install  hypre
$TWOPI install  metis
$TWOPI install  parmetis
$TWOPI install  MUMPS
$TWOPI install  mfems
$TWOPI install  mfemp
$TWOPI install  PyMFEM
$TWOPI install  PetraM_Base
$TWOPI install  PetraM_RF
$TWOPI install  PetraM_Geom
$TWOPI install  PetraM_Driver
$TWOPI install  PetraM_MUMPS


