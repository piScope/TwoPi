#!/bin/bash

# common envriomental variables

piScope_REPO=piScope

# Strumpack
STRUMPACK_REPO=STRUMPACK-3.1.1

# OpenCASCADE
OCC=opencascade-7.4.0

# Python OCC
PyOCC=pythonocc-core

# GMSH
GMSH=gmsh-4.5.6

# HYPRE
HYPRE_VERSION=2.18.2

# MUMPS
MUMPS_VERSION=5.3.4
MUMPS_REPO=MUMPS_${MUMPS_VERSION}

# SCOTCH
#    SCOTCH_DL is encoded in the download link.
#    It needs to be updated when updating scotch version
SCOTCH_DL=38352
SCOTCH_VERSION=6.1.0

# Lapack
LAPACK_VERSION=3.9.0

# Scalapack
SCALAPACK_VERSION=2.1.0

# C++11 flag
CXX11FLAG=-std=c++11

# make runs using the half of processor cores
NPROCHALF=$((($(nproc)+1)/2))
MAKEOPT="-j "${NPROCHALF}
