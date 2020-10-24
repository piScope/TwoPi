#
#  This file is part of MUMPS 5.1.1, released
#  on Mon Mar 20 14:34:33 UTC 2017
#
# These settings for a PC under Debian/linux with standard packages :
# metis (parmetis), scotch (ptscotch), openmpi, gfortran

# packages installation : 
# apt-get install libmetis-dev libparmetis-dev libscotch-dev libptscotch-dev libatlas-base-dev openmpi-bin libopenmpi-dev lapack-dev

########################################################################
#Begin orderings
#
#
#   This ordering section is edited by TwoPi
#
#
# NOTE that PORD is distributed within MUMPS by default. It is recommended to
# install other orderings. For that, you need to obtain the corresponding package
# and modify the variables below accordingly.
# For example, to have Metis available within MUMPS:
#          1/ download Metis and compile it
#          2/ uncomment (suppress # in first column) lines
#             starting with LMETISDIR,  LMETIS
#          3/ add -Dmetis in line ORDERINGSF
#             ORDERINGSF  = -Dpord -Dmetis
#          4/ Compile and install MUMPS
#             make clean; make   (to clean up previous installation)
#
#          Metis/ParMetis and SCOTCH/PT-SCOTCH (ver 6.0 and later) orderings are recommended.
#

#SCOTCHDIR  = ${HOME}/scotch_6.0
#ISCOTCH    = -I$(SCOTCHDIR)/include
#
# You have to choose one among the following two lines depending on
# the type of analysis you want to perform. If you want to perform only
# sequential analysis choose the first (remember to add -Dscotch in the ORDERINGSF
# variable below); for both parallel and sequential analysis choose the second 
# line (remember to add -Dptscotch in the ORDERINGSF variable below)

#LSCOTCH    = -L$(SCOTCHDIR)/lib -lesmumps -lscotch -lscotcherr
#LSCOTCH    = -L$(SCOTCHDIR)/lib -lptesmumps -lptscotch -lptscotcherr

LPORDDIR = $(topdir)/PORD/lib/
IPORD    = -I$(topdir)/PORD/include/
LPORD    = -L$(LPORDDIR) -lpord

#LMETISDIR = /opt/metis-5.1.0/build/Linux-x86_64/libmetis
#IMETIS    = /opt/metis-5.1.0/include

# You have to choose one among the following two lines depending on
# the type of analysis you want to perform. If you want to perform only
# sequential analysis choose the first (remember to add -Dmetis in the ORDERINGSF
# variable below); for both parallel and sequential analysis choose the second 
# line (remember to add -Dparmetis in the ORDERINGSF variable below)

#LMETIS    = -L$(LMETISDIR) -lmetis
#LMETIS    = -L$(LMETISDIR) -lparmetis -lmetis

# The following variables will be used in the compilation process.
# Please note that -Dptscotch and -Dparmetis imply -Dscotch and -Dmetis respectively.
# If you want to use Metis 4.X or an older version, you should use -Dmetis4 instead of -Dmetis
# or in addition with -Dparmetis (if you are using parmetis 3.X or older).
#ORDERINGSF = -Dscotch -Dmetis -Dpord -Dptscotch -Dparmetis
ORDERINGSF  = -Dpord
ORDERINGSC  = $(ORDERINGSF)

LORDERINGS = $(LMETIS) $(LPORD) $(LSCOTCH)
IORDERINGSF = $(ISCOTCH)
IORDERINGSC = $(IMETIS) $(IPORD) $(ISCOTCH)

#End orderings
########################################################################

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
