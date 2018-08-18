## TwoPi

TwoPi is a repository to collect install scripts to build the piScope/PetraM
toolsets.

## Configuration

# Enviromental Variables
Following variables are used in TwoPi internally 
```
 export TwoPiDevice=linux (DockerDebian, MITengaging, cori, brew, highSierra...)
 export TwoPiGit=git@github.com:piScope  # repo for piScope/Petra-M modules
 export TwoPiRoot=/usr/local/twopi       # install location
```
To use piScope/PetraM, one needs to edit PATH and PYTHONPATH.
```
 # add bin and python path
 export PATH=$TwoPiRoot/bin:$PATH        
 export PYTHONPATH=$TwoPiRoot/lib/python2.7/site-packages:$PYTHONPATH

```
# Install packages

bin/twopi is the front-end command.

  bin/twopi <action> <component> <optional argments>


action:
   clone : download source file or perform git pull
   build : build a component from source
   clean : clean working directory
           (typically, make clean or rm -rf cmbuild is called)

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
   PyMFEM:

   PetraM_Base:
   PetraM_RF:
   PetraM_Geom:
   PetraM_Driver:         
   
