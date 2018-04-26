#!/bin/sh

SRCDIR=${TwoPiRoot}/src
REPO=${SRCDIR}/PetraM_Driver
MAKE=$(command -v make)

cd $REPO
cp Makefile_templates/Makefile_default Makefile
mkdir -p etc
mkdir -p ${TwoPiRoot}/etc
cp templates/queue_config_${TwoPiDevice} etc/queue_config
cp templates/slurm_batch_script_${TwoPiDevice} etc/slurm_batch

export PetraM=${TwoPiRoot}

$MAKE
$MAKE install
