# TwoPi
TwoPi (stands for (p)iScope/(P)etra-M) is a package installer for piScope/Petra-M.
It is made from the collection of install scripts to configure various libraries
in a coherent way to run Petra-M simulation.

## Usage
  1) Initialize viertualenv using twopi-init
         bin/twopi init <device> <location>

         device : a parameter to specify the cluster/client enviroment
    	          (ex. MITengaging, cori, brew)
	 location : install location
	 
         ex) bin/twopi init  MITengaging $HOME/twopi_roots/20190724
	 
  2) source <location>/bin/twopi_env.sh
       this script setup enviromental variabls for TwoPi
         TwoPiDevice : <device> used in step 1
         TwoPiGit : git repo for piScope/Petra-M modules (default github.com/piscope)
         TwoPiRoo : <location> used in step 1
	 
  3) Install numpy/scipy
       Petra-M needs numpy/scipy compiled using the same compiler being used to
       build following components. If the system provided numpy/scipy is not the
       one built by the same compilere you need to build
       
  4) Install packages using twopi-install or twopi-clone/build/clean
   
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
        install hypre 2.16.2 (shared library)
   metis : 
        install metis 5.1.0 (shared library)
   parmetis : 
        install parmetis 4.0.3 (shared library)
   OpenCascade :
        install OOC 7.3.0
   gmsh:
        install gmsh 4.3.0
   MUMPS (metis, parmetis):
        install MUMSP 5.2.0
	Metis/ParMetis BLR OpenMP MPI
   scotch:
        Both static and shared library is installed
   strumpack (scotch, metis, parmetis):
        install Strumpack 3.1.1
	ParMetis, Scotch are on
   mfem (metis, hypre):
        mfems install serial
        mfemp install parallel
	
        optional argments:
           -s: build PyMFEM serial (mfem.ser)
	   -p: build PyMFEM parallel (mfem.par)
	   
	   --clean-swig: delete all swig files (need to rerun --run-swig)
	   --run-swig: generate wrapper codes

           By default, twopi will use Boost and MPI include/link
	   path found by CMAKE. Following argument can be used
	   to overwrite these paths
   	      -boost_root, -boost_inc, -boost_lib,
	      -mpi_root, -mpi_inc, -mpi_lib

   PythonModule: Python module dependency
       build : do all pip install   
       install : same as build
       
   piScope:
       clone --checkout <Branch>
       
   PyMFEM:

   PetraM_Base:
       clone --checkout <Branch>
       
   PetraM_RF:
       clone --checkout <Branch>
       
   PetraM_Geom:
       clone --checkout <Branch>
       
   PetraM_Driver:
       This modules requires a non-public repository

   modules
       install
```   
