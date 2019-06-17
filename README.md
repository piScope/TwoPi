# TwoPi
TwoPi (stands for (p)iScope/(P)etra-M) is a package installer
for piScope/Petra-M. It is made from the collection of install scripts
to configure various libraries in a coherent way to run Petra-M simulation.

## Usage
### Enviromental Variables
Following variables are used in TwoPi internally 
```
 export TwoPiDevice=linux #DockerDebian, MITengaging, cori, brew,,,)
 export TwoPiGit=git@github.com:piScope  # repo for piScope/Petra-M modules
 export TwoPiRoot=/usr/local/twopi       # install location
```
To use piScope/PetraM, one needs to edit PATH and PYTHONPATH.
```
 # add bin and python path
 export PetraM=$TwoPiRoot
 export PATH=$TwoPiRoot/bin:$PATH        
 export PYTHONPATH=$TwoPiRoot/lib/python2.7/site-packages:$PYTHONPATH

```
### Install packages

bin/twopi is the front-end command.

```
bin/twopi <action> <component> <optional argments>

action:
   init  : initialize twopi target root
   clone : download source file or perform git pull
   build : build a component from source
   clean : clean working directory
           (typically, make clean or rm -rf cmbuild is called)
   install: do above three together
   
component (dependency):
   SWIG :
   	install swig 3.0.12
   hypre :
        install hypre 2.11.2 (shared library)
   metis : 
        install metis 5.1.0 (shared library)
   parmetis : 
        install parmetis 4.0.3 (shared library)
   OpenCascade :
        install OOC 7.2.0
   gmsh:
        install gmsh 3.0.6
   MUMPS (metis, parmetis):
        install MUMSP 5.1.2
	Metis/ParMetis BLR OpenMP MPI
   scotch:
        Both static and shared library is installed
   strumpack (scotch, metis, parmetis):
        install Strumpack 2.2.0
	ParMetis, Scotch are on
   mfem (metis, hypre):
        mfems install serial
        mfemp install parallel
	
        optional argments:
           -s: build PyMFEM serial (mfem.ser)
	   -p: build PyMFEM parallel (mfem.par)

           By default, twopi will use Boost and MPI include/link
	   path found by CMAKE. Following argument can be used
	   to overwrite these paths
   	      -boost_root, -boost_inc, -boost_lib,
	      -mpi_root, -mpi_inc, -mpi_lib


   PyMFEM:

   PetraM_Base:
   PetraM_RF:
   PetraM_Geom:
   PetraM_Driver:         
```   
