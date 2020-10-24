#  This file is genearated based on INTEL.SEQ 
#
#  This file is part of MUMPS 5.2.0, released
#  on Thu Apr 18 09:55:07 UTC 2019
#

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
CC = $(MPICC)
FC = $(MPIFC)
FL = $(MPIFL)
AR = ar vr 
#RANLIB = ranlib
RANLIB  = echo

# Make this variable point to the path where the Intel MKL library is
# installed. It is set to the default install directory for Intel MKL.

#MKLROOT=/opt/intel/mkl/lib/intel64
SCALAP = $(MUMPS_SCALAPACK_FLAG)
LAPACK = $(MUMPS_BLASLAPACK_FLAG)

INCPAR = $(MUMPS_INC_PAR)
LIBPAR = $(SCALAP) 

INCSEQ = -I$(topdir)/libseq
LIBSEQ  = $(LAPACK) -L$(topdir)/libseq -lmpiseq

#LIBBLAS = $(MUMPS_BLASLAPACK_FLAG)
#LIBOTHERS = -lpthread
LIBBLAS = $(MUMPS_SCALAPACK_FLAG)
LIBOTHERS = -lpthread -lm -ldl

#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
OPTF    = -O -fPIC -nofor_main -DBLR_MT $(OMPFCFLAG)
#OPTF    = -O -fPIC  -DBLR_MT $(OMPFCFLAG)
OPTL    = -O -fPIC -nofor_main -DBLR_MT $(OMPLINKFLAG)
#OPTL    = -O -fPIC -DBLR_MT $(OMPLINKFLAG)
OPTC    = -O -fPIC  $(OMPFCFLAG)
#End Optimized options
 
#INCS = $(INCSEQ)
#LIBS = $(LIBSEQ)
#LIBSEQNEEDED = libseqneeded
INCS = $(INCPAR)
LIBS = $(LIBPAR)
LIBSEQNEEDED = 
