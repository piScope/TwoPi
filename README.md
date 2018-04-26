## TwoPi

TwoPi is a repository to collect instrall scripts to build the piScope/PetraM
toolsets.

## Supported Libraries

swig 3.0.12
hypre 2.11.2
metis 5.1.0
parmetis 4.0.3
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
```
# build everything...
```
 ./scripts/buildcomponent.sh SWIG clone
 ./scripts/buildcomponent.sh SWIG build

 ./scripts/buildcomponent.sh mfem clone
 ./scripts/buildcomponent.sh mfems build

 ./scripts/buildcomponent.sh hypre clone
 ./scripts/buildcomponent.sh hypre build

 ./scripts/buildcomponent.sh metis clone
 ./scripts/buildcomponent.sh metis build

 ./scripts/buildcomponent.sh mfemp build

 ./scripts/buildcomponent.sh PyMFEM clone
 ./scripts/buildcomponent.sh PyMFEM build 

 ./scripts/buildcomponent.sh PetraM_Base clone
 ./scripts/buildcomponent.sh PetraM_Base build 

 ./scripts/buildcomponent.sh PetraM_RF clone
 ./scripts/buildcomponent.sh PetraM_RF build 

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


