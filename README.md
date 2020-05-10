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
       
  4) Install packages 
       install everything using 
           bin/twopi install modules
       or each packages separately by using twopi-install or twopi-clone/build/clean

   
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
   update: update installed package (only for Petra-M modules)
   status: repository status of Petra-M modules
   selfupdate : update TwoPi install.
   
component (dependency):
   modules : install all packages necessary to setup Petra-M client enviroment
       PythonModule, OCC, gmsh, hypre, metis, parmetis, MUMPS,
       mfem (serial/parallel), PyMFEM, PetraM_Base,
       PetraM_Geom, PetraM_MUMPS, PetraM_RF

       <options>
       --PyMFEM-branch <branch> : PyMFEM branch 
       --piScope-branch <branch> : piScope 
       --PetraM-Repo <repo>     : Petra-M repository (default git@github.com:piScope)
       --PetraM-branch <branch> : Petra-M branch
       --no-wx 
       --no-occ-gmsh 
       --log-dir <location> : location of log files


   SWIG :
   	install swig 4.0.1
   mpi4py:
        install using mpicc given in env_<device>.sh
   hypre :
        install hypre 2.18.2 (shared library)
   metis : 
        install metis 5.1.0 (shared library)
   parmetis : 
        install parmetis 4.0.3 (shared library)
   OpenCascade :
        install OOC 7.4.0
   PyOCC:
        install pythonocc-core
   gmsh:
        install gmsh 4.5.4
   MUMPS (metis, parmetis):
        install MUMSP 5.3.1
	Metis/ParMetis BLR OpenMP MPI
   scotch:
        Both static and shared library is installed
	
   strumpack (scotch, metis, parmetis):
        install Strumpack 3.1.1
	ParMetis, Scotch are off for now.

   PyStrumpack:
        clone
	 
   PUMI
        clone : https://github.com/SCOREC/core.git
	build :
          optinal argments:
	     --with-test : run test (need to have PUMI-MESHES cloned)
	     --with-simmetrix :
	     --simmetrix-lib <dir>: simmetrix library location
	clean
	
   PUMI-MESHES 
        clone : 
   PUMI-PYTHON
        (no clone, this is part of SCOREC/core, need to swith python_wrapper baranch)
        build
	clean
	
   mfem (metis, hypre):
        mfems install serial
        mfemp install parallel
          optinal argments:
	      --with-pumi : use pumi

   PythonModule: Python module dependency
       build : do all pip install
          optinal argments:
              --force-reinstall: use pip --force-install
              --no-wx: skip wxPython
       install : same as build
       
   piScope:
       clone --checkout <Branch>
       
   PyMFEM:
        optional argments:
           -s: build PyMFEM serial (mfem.ser)
	   -p: build PyMFEM parallel (mfem.par)
	   
	   --clean-swig: delete all swig files (need to rerun --run-swig)
	   --run-swig: generate wrapper codes

           By default, twopi will use MPI include/link
	   path found by CMAKE. Following argument can be used
	   to overwrite these paths
	      -mpi_root, -mpi_inc, -mpi_lib

           --with-pumi: compile with pumi
	   --pumi-include: PUMI include dir (default is $TwoPiRoot/include)
	   --pumi-lib: PUMI lib dir (default is $TwoPiRoot/lib)

   PetraM_Base:
       clone --checkout <Branch>
       
   PetraM_RF:
       clone --checkout <Branch>
       
   PetraM_Geom:
       clone --checkout <Branch>

   PetraM_MUMPS:
       clone
       build
          option:
	     --run-swig : generate SWIG wrapper code
	     --clean-swig : clean SWIG
	     wrapper code

   PetraM_Base_ext:
          option:
	     --run-swig : generate SWIG wrapper code
	     --clean-swig : clean SWIG
	     --clean-all : clean SWIG + ext 

   PetraM_MPW:
          option:
	     --run-swig : generate SWIG wrapper code
	     --clean-swig : clean SWIG
	     --clean-all : clean SWIG + ext 

   PetraM_Driver:
       This modules requires a non-public repository

```   
