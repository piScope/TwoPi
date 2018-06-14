## TwoPi

TwoPi is a repository to collect install scripts to build the piScope/PetraM
toolsets.

## Supported Libraries

swig 3.0.12
hypre 2.11.2
metis 5.1.0
parmetis 4.0.3
OpenCascade 7.2
gmsh 3.0.6
MUMPS 5.1.2
mfem
PyMFEM (serial/parallel)
PetraM (Base, RF, Geom, MUMPS)

## Usage

# A user has to define the following three variables.
```
 export TwoPiRoot=/home/xxxx/twopi
 export TwoPiDevice=linux (DockerDebian, MITengaging, cori, highSierra...)
 export PATH=$TwoPiRoot/bin:$PATH
 export PYTHONPATH=$TwoPiRoot/lib/python2.7/site-packages:$PYTHONPATH

 Below is note for developer...
 If these variables are set, these variable are used when -d option is
 used

 export TwoPiRootDev=/home/xxxx/twopi_dev
 export TwoPiGitDev=git@github.mit.edu:shiraiwa (default is git@github.com:piScope)
```
# build everything...
```
 ./scripts/buildcomponent.sh SWIG clone
 ./scripts/buildcomponent.sh SWIG build

 # this step needs to download OOC-7.2 manually from the developer web site.
 ./scripts/buildcomponent.sh OOC clone
 ./scripts/buildcomponent.sh OOC build
 
 ./scripts/buildcomponent.sh gmsh clone
 ./scripts/buildcomponent.sh gmsh build

 ./scripts/buildcomponent.sh mfem clone
 ./scripts/buildcomponent.sh mfems build

 ./scripts/buildcomponent.sh hypre clone
 ./scripts/buildcomponent.sh hypre build

 ./scripts/buildcomponent.sh metis clone
 ./scripts/buildcomponent.sh metis build
 
 ./scripts/buildcomponent.sh parmetis clone
 ./scripts/buildcomponent.sh parmetis build

 # installing MUMPS requires to provide Makefile.inc (See MUMPS installation manual)
 ./scripts/buildcomponent.sh MUMPS clone
 ./scripts/buildcomponent.sh MUMPS build

 ./scripts/buildcomponent.sh mfemp build

 ./scripts/buildcomponent.sh PyMFEM clone
 ./scripts/buildcomponent.sh PyMFEM build 
   option : ./scripts/buildcomponent.sh PyMFEM build -s -p --boost-root /home/user
            -s build serial only
            -p build parallel only
            --boost-root set default boost directory

 ./scripts/buildcomponent.sh PetraM_Base clone
 ./scripts/buildcomponent.sh PetraM_Base build 

 ./scripts/buildcomponent.sh PetraM_RF clone
 ./scripts/buildcomponent.sh PetraM_RF build 

 ./scripts/buildcomponent.sh PetraM_Geom clone
 ./scripts/buildcomponent.sh PetraM_Geom build

 ./scripts/buildcomponent.sh PetraM_Driver clone
 ./scripts/buildcomponent.sh PetraM_Driver build 

 ./scripts/buildcomponent.sh PetraM_MUMPS clone
 ./scripts/buildcomponent.sh PetraM_MUMPS build 

```

## ToDo

add update command
add dependency check?


