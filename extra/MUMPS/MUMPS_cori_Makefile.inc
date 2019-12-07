#
#  This file is part of MUMPS 5.1.1, released
#  on Mon Mar 20 14:34:33 UTC 2017
#
# These settings for a PC under Debian/linux with standard packages :
# metis (parmetis), scotch (ptscotch), openmpi, gfortran

# packages installation : 
# apt-get install libmetis-dev libparmetis-dev libscotch-dev libptscotch-dev libatlas-base-dev openmpi-bin libopenmpi-dev lapack-dev

# Begin orderings
LSCOTCHDIR = $(TwoPiRoot)
ISCOTCH   = -I$(SCOTCHDIR)/include

#LSCOTCH   = -L$(LSCOTCHDIR) -lptesmumps -lptscotch -lptscotcherr
#LSCOTCH   = -L$(LSCOTCHDIR) -lesmumps -lscotch -lscotcherr

LPORDDIR = $(topdir)/PORD/lib/
IPORD    = -I$(topdir)/PORD/include/
LPORD    = -L$(LPORDDIR) -lpord

LMETISDIR = $(TwoPiRoot)
IMETIS    = -I$(LMETISDIR)/include

# LMETIS    = -L$(LMETISDIR) -lparmetis -lmetis
LMETIS    = -L$(LMETISDIR)/lib -lparmetis -lmetis

# Corresponding variables reused later
#ORDERINGSF = -Dmetis -Dpord -Dparmetis -Dscotch -Dptscotch
#ORDERINGSF = -Dmetis -Dpord -Dscotch
ORDERINGSF =  -Dmetis -Dpord  -Dparmetis
ORDERINGSC  = $(ORDERINGSF)

LORDERINGS = $(LMETIS) $(LPORD) $(LSCOTCH)
IORDERINGSF = $(ISCOTCH)
IORDERINGSC = $(IMETIS) $(IPORD) $(ISCOTCH)
# End orderings
################################################################################

PLAT    =
LIBEXT  = .a
OUTC    = -o 
OUTF    = -o 
RM = /bin/rm -f
CC = cc
FC = ftn
FL = ftn
AR = ar vr 
RANLIB = ranlib
# Make this variable point to the path where the Intel MKL library is
# installed. It is set to the default install directory for Intel MKL. 
#MKLROOT=/opt/intel/mkl/lib/intel64
#MKLROOT=/home/software/intel/2017-01/compilers_and_libraries_2017.1.132/linux/mkl/lib/intel64
#LAPACK = -llapack

#SCALAP = -lscalapack
INCPAR = -I/usr/lib/openmpi/include
LIBPAR = $(SCALAP) 

INCSEQ = -I$(topdir)/libseq
LIBSEQ  = $(LAPACK) -L$(topdir)/libseq -lmpiseq

#LIBBLAS = -lblas
LIBOTHERS = -lpthread

#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
# uncomment -fopenmp in lines below to benefit from OpenMP
# -nofor_main (intel compiler option to use MUMPS from C main)
OPTF    = -O -fPIC -DBLR_MT -nofor_main -qopenmp # -fopenmp
OPTL    = -O -fPIC -DBLR_MT -nofor_main -qopenmp # -fopenmp
OPTC    = -O -fPIC -qopenmp# -fopenmp
#End Optimized options
INCS = $(INCPAR)
LIBS = $(LIBPAR)
LIBSEQNEEDED =
