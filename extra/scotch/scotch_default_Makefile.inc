EXE		=
LIB		= .a
OBJ		= .o

MAKE		= make
AR		= ar
ARFLAGS		= -ruv
CAT		= cat
#CCS		= ignore this
#CCP		= ignore this
#CCD		= ignore this
CFLAGS		= -O3 -DCOMMON_FILE_COMPRESS_GZ -DCOMMON_PTHREAD -DCOMMON_RANDOM_FIXED_SEED -DSCOTCH_RENAME -DSCOTCH_PTHREAD -Drestrict=__restrict -DIDXSIZE64
CLIBFLAGS	= -fPIC
LDFLAGS		= -lz -lm -lrt -pthread
CP		= cp
LEX		= flex -Pscotchyy -olex.yy.c
LN		= ln
MKDIR		= mkdir
MV		= mv
RANLIB		= ranlib
YACC		= bison -pscotchyy -y -b y
