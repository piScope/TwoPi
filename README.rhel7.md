## setup dir

```
mkdir ~/petram
cd !$
```

## create env file 

create `setup.env` with the following contents

```
export TwoPiGit=https://github.com/piScope
export TwoPiDevice=scorecrhel7
export TwoPiRoot=~/petram/twopi_scorecrhel7
export LD_LIBRARY_PATH=$TwoPiRoot/lib:$LD_LIBRARY_PATH
export PATH=$TwoPiRoot/bin:$PATH
export PYTHONPATH=$TwoPiRoot/lib/python2.7/site-packages:$PYTHONPATH
export PetraM=$TwoPiRoot
module load gcc/7.3.0-bt47fwr
module load mpich
module load cmake
module load tcl
module load tk
module load boost
module load openblas/0.3.5-7miavkp
module load netlib-scalapack
```

## setup python

``` 
git clone git@github.com:piScope/TwoPi.git
virtualenv --python=/usr/bin/python --system-site-packages --unzip-setup twopi_scorecrhel7
source setup.env
pip install -U pip
pip install wxPython==4.0.3
pip install -U mpi4py
pip install -U PyPDF2
pip install -U Pillow
pip install -U pdfrw
pip install -U h5py
pip install -U netCDF4
pip install -U matplotlib
pip install -U numpy
pip install -U pyopengl
pip install -U scipy  # requires version 1.1 or greater
```


## install opencascade

download opencascade from https://www.opencascade.com/content/previous-releases
... requires registration, copy the tarball to `TwoPi/externals`

I then had to modify `scripts/OOC_default_clone.sh` to use the correct tarball
extension (`.tgz not .tar.gz`).
The script changes are in the `cwsmith/rhel7` branch of the
`~/petram/TwoPi` repo.
There is also some madness in the CMakeLists.txt of opencascade for specifying
the install directory.  I did not want to dip into the insanity so I set both
`INSTALL_DIR` and `CMAKE_INSTALL_PREFIX`.  There are also `*_PREV` versions of
these variables for some crazy reason.

```
bin/twopi install OOC
```

## install gmsh

A few small modifications were required for gmsh.  They have been committed to
the `cwsmith/rhel7` branch.

```
bin/twopi install gmsh
```

## install mfem

no changes

```
bin/twopi clone mfem
bin/twopi build mfems
bin/twopi install hypre
bin/twopi install metis
bin/twopi install parmetis
bin/twopi build mfemp
```

## install pymfem

When boost is not found the cmake command fails but does not cause the install
to exit.

```
bin/twopi install PyMFEM
```

## install mumps

modified paths to lapack and blas in MUMPS_PAR_Makefile.inc

```
bin/twopi install-noclean  MUMPS
```

## install glvis

glvis 3.4 is required, modified glvis_default_build.sh 

```
bin/twopi install glvis
```

## install the remaining packages

```
bin/twopi install PetraM_Base
bin/twopi install PetraM_RF
bin/twopi install PetraM_Geom
bin/twopi install PetraM_MUMPS
bin/twopi install piScope
```

## run petram

```
module load petram
source $TwoPiRoot/bin/activate
piscope
```

In piscope type `petram()`


