#!/bin/bash
DCABS1=./tests/conformance/_shared/dcabs1.f
XERBLA=./tests/conformance/_shared/xerbla.f
LSAME=./tests/conformance/_shared/lsame.f
test -d ./jsonfortran-gnu-7.0.0 && L=./jsonfortran-gnu-7.0.0/lib/libjsonfortran.a
test -d ./jsonfortran-gnu-7.0.0 && I=-I./jsonfortran-gnu-7.0.0/lib
test -d $HOME/json-fortran/build/lib  && L=$HOME/json-fortran/build/lib/libjsonfortran.a || L=/usr/local/Cellar/json-fortran/6.10.0/lib/libjsonfortran.a
test -d $HOME/json-fortran/build/include  && I=-I$HOME/json-fortran/build/include || I=-I/usr/local/Cellar/json-fortran/6.10.0/include
LIB=-ljsonfortran
GEN=/gen
FIXTURE=/fixture.f90

LEVEL1=./tests/conformance/level1/
LEVEL1C=./tests/conformance/level1/complex/
mkdir -p ./tests/fixtures/{level1/complex,level2/complex,level3/complex,matrix}

ASUM=asum
gfortran $LEVEL1$ASUM/d$ASUM.f $LEVEL1$ASUM$FIXTURE $LSAME $XERBLA -o $LEVEL1$ASUM$GEN $L $I
test -f $LEVEL1$ASUM$GEN && $LEVEL1$ASUM$GEN
test -f $LEVEL1$ASUM$GEN  && rm $LEVEL1$ASUM$GEN
gfortran $LEVEL1C$ASUM/dz$ASUM.f $LEVEL1C$ASUM$FIXTURE $LSAME $XERBLA $DCABS1 -o $LEVEL1C$ASUM$GEN $L $I
test -f $LEVEL1C$ASUM$GEN && $LEVEL1C$ASUM$GEN
test -f $LEVEL1C$ASUM$GEN && rm $LEVEL1C$ASUM$GEN

AXPY=axpy
gfortran $LEVEL1$AXPY/d$AXPY.f $LEVEL1$AXPY$FIXTURE $LSAME $XERBLA -o $LEVEL1$AXPY$GEN $L $I
test -f $LEVEL1$AXPY$GEN && $LEVEL1$AXPY$GEN
test -f $LEVEL1$AXPY$GEN && rm $LEVEL1$AXPY$GEN
gfortran $LEVEL1C$AXPY/z$AXPY.f $LEVEL1C$AXPY$FIXTURE $LSAME $XERBLA $DCABS1 -o $LEVEL1C$AXPY$GEN $L $I
test -f $LEVEL1C$AXPY$GEN && $LEVEL1C$AXPY$GEN
test -f $LEVEL1C$AXPY$GEN && rm $LEVEL1C$AXPY$GEN

COPY=copy
gfortran $LEVEL1$COPY/d$COPY.f $LEVEL1$COPY$FIXTURE $LSAME $XERBLA -o $LEVEL1$COPY$GEN $L $I
test -f $LEVEL1$COPY$GEN && $LEVEL1$COPY$GEN
test -f $LEVEL1$COPY$GEN && rm $LEVEL1$COPY$GEN
gfortran $LEVEL1C$COPY/z$COPY.f $LEVEL1C$COPY$FIXTURE $LSAME $XERBLA -o $LEVEL1C$COPY$GEN $L $I
test -f $LEVEL1C$COPY$GEN && $LEVEL1C$COPY$GEN
test -f $LEVEL1C$COPY$GEN && rm $LEVEL1C$COPY$GEN

DDOT=ddot
gfortran $LEVEL1$DDOT/sdsdot.f $LEVEL1$DDOT$FIXTURE $LSAME $XERBLA -o $LEVEL1$DDOT$GEN $L $I
test -f $LEVEL1$DDOT$GEN && $LEVEL1$DDOT$GEN
test -f $LEVEL1$DDOT$GEN && rm $LEVEL1$DDOT$GEN

DOT=dot
gfortran $LEVEL1$DOT/d$DOT.f $LEVEL1$DOT$FIXTURE $LSAME $XERBLA -o $LEVEL1$DOT$GEN $L $I
test -f $LEVEL1$DOT$GEN && $LEVEL1$DOT$GEN
test -f $LEVEL1$DOT$GEN && rm $LEVEL1$DOT$GEN

DOTC=dotc
gfortran $LEVEL1C$DOTC/z$DOTC.f $LEVEL1C$DOTC$FIXTURE $LSAME $XERBLA -o $LEVEL1C$DOTC$GEN $L $I
test -f $LEVEL1C$DOTC$GEN && $LEVEL1C$DOTC$GEN
test -f $LEVEL1C$DOTC$GEN && rm $LEVEL1C$DOTC$GEN

DOTU=dotu
gfortran $LEVEL1C$DOTU/z$DOTU.f $LEVEL1C$DOTU$FIXTURE $LSAME $XERBLA -o $LEVEL1C$DOTU$GEN $L $I
test -f $LEVEL1C$DOTU$GEN && $LEVEL1C$DOTU$GEN
test -f $LEVEL1C$DOTU$GEN && rm $LEVEL1C$DOTU$GEN

IAMAX=iamax
gfortran $LEVEL1$IAMAX/idamax.f $LEVEL1$IAMAX$FIXTURE $LSAME $XERBLA -o $LEVEL1$IAMAX$GEN $L $I
test -f $LEVEL1$IAMAX$GEN && $LEVEL1$IAMAX$GEN
test -f $LEVEL1$IAMAX$GEN && rm $LEVEL1$IAMAX$GEN
gfortran $LEVEL1C$IAMAX/izamax.f $LEVEL1C$IAMAX$FIXTURE $LSAME $XERBLA $DCABS1 -o $LEVEL1C$IAMAX$GEN $L $I
test -f $LEVEL1C$IAMAX$GEN && $LEVEL1C$IAMAX$GEN
test -f $LEVEL1C$IAMAX$GEN && rm $LEVEL1C$IAMAX$GEN

NRM2=nrm2
gfortran $LEVEL1$NRM2/d$NRM2.f $LEVEL1$NRM2$FIXTURE $LSAME $XERBLA -o $LEVEL1$NRM2$GEN $L $I
test -f $LEVEL1$NRM2$GEN && $LEVEL1$NRM2$GEN
test -f $LEVEL1$NRM2$GEN && rm $LEVEL1$NRM2$GEN
gfortran $LEVEL1C$NRM2/dz$NRM2.f $LEVEL1C$NRM2$FIXTURE $LSAME $XERBLA $DCABS1 -o $LEVEL1C$NRM2$GEN $L $I
test -f $LEVEL1C$NRM2$GEN && $LEVEL1C$NRM2$GEN
test -f $LEVEL1C$NRM2$GEN && rm $LEVEL1C$NRM2$GEN

ROT=rot
gfortran $LEVEL1$ROT/d$ROT.f $LEVEL1$ROT$FIXTURE $LSAME $XERBLA -o $LEVEL1$ROT$GEN $L $I
test -f $LEVEL1$ROT$GEN && $LEVEL1$ROT$GEN
test -f $LEVEL1$ROT$GEN && rm $LEVEL1$ROT$GEN
gfortran $LEVEL1C$ROT/zd$ROT.f $LEVEL1C$ROT$FIXTURE $LSAME $XERBLA -o $LEVEL1C$ROT$GEN $L $I
test -f $LEVEL1C$ROT$GEN && $LEVEL1C$ROT$GEN
test -f $LEVEL1C$ROT$GEN && rm $LEVEL1C$ROT$GEN

ROTG=rotg
gfortran $LEVEL1$ROTG/d$ROTG.f $LEVEL1$ROTG$FIXTURE $LSAME $XERBLA -o $LEVEL1$ROTG$GEN $L $I
test -f $LEVEL1$ROTG$GEN && $LEVEL1$ROTG$GEN
test -f $LEVEL1$ROTG$GEN && rm $LEVEL1$ROTG$GEN
gfortran $LEVEL1C$ROTG/z$ROTG.f $LEVEL1C$ROTG$FIXTURE $LSAME $XERBLA -o $LEVEL1C$ROTG$GEN $L $I
test -f $LEVEL1C$ROTG$GEN && $LEVEL1C$ROTG$GEN
test -f $LEVEL1C$ROTG$GEN && rm $LEVEL1C$ROTG$GEN

ROTM=rotm
gfortran $LEVEL1$ROTM/d$ROTM.f $LEVEL1$ROTM$FIXTURE $LSAME $XERBLA -o $LEVEL1$ROTM$GEN $L $I
test -f $LEVEL1$ROTM$GEN && $LEVEL1$ROTM$GEN
test -f $LEVEL1$ROTM$GEN && rm $LEVEL1$ROTM$GEN

ROTMG=rotmg
gfortran $LEVEL1$ROTMG/d$ROTMG.f $LEVEL1$ROTMG$FIXTURE $LSAME $XERBLA -o $LEVEL1$ROTMG$GEN $L $I
test -f $LEVEL1$ROTMG$GEN && $LEVEL1$ROTMG$GEN
test -f $LEVEL1$ROTMG$GEN && rm $LEVEL1$ROTMG$GEN

SCAL=scal
gfortran $LEVEL1$SCAL/d$SCAL.f $LEVEL1$SCAL$FIXTURE $LSAME $XERBLA -o $LEVEL1$SCAL$GEN $L $I
test -f $LEVEL1$SCAL$GEN && $LEVEL1$SCAL$GEN
test -f $LEVEL1$SCAL$GEN && rm $LEVEL1$SCAL$GEN
gfortran $LEVEL1C$SCAL/z$SCAL.f $LEVEL1C$SCAL$FIXTURE $LSAME $XERBLA -o $LEVEL1C$SCAL$GEN $L $I
test -f $LEVEL1C$SCAL$GEN && $LEVEL1C$SCAL$GEN
test -f $LEVEL1C$SCAL$GEN && rm $LEVEL1C$SCAL$GEN

SSCAL=sscal
gfortran $LEVEL1C$SSCAL/zd$SCAL.f $LEVEL1C$SSCAL$FIXTURE $LSAME $XERBLA -o $LEVEL1C$SSCAL$GEN $L $I
test -f $LEVEL1C$SSCAL$GEN && $LEVEL1C$SSCAL$GEN
test -f $LEVEL1C$SSCAL$GEN && rm $LEVEL1C$SSCAL$GEN

SWAP=swap
gfortran $LEVEL1$SWAP/d$SWAP.f $LEVEL1$SWAP$FIXTURE $LSAME $XERBLA -o $LEVEL1$SWAP$GEN $L $I
test -f $LEVEL1$SWAP$GEN && $LEVEL1$SWAP$GEN
test -f $LEVEL1$SWAP$GEN && rm $LEVEL1$SWAP$GEN
gfortran $LEVEL1C$SWAP/z$SWAP.f $LEVEL1C$SWAP$FIXTURE $LSAME $XERBLA -o $LEVEL1C$SWAP$GEN $L $I
test -f $LEVEL1C$SWAP$GEN && $LEVEL1C$SWAP$GEN
test -f $LEVEL1C$SWAP$GEN && rm $LEVEL1C$SWAP$GEN

LEVEL2=./tests/conformance/level2/
LEVEL2C=./tests/conformance/level2/complex/

GBMV=gbmv
gfortran $LEVEL2$GBMV/d$GBMV.f $LEVEL2$GBMV$FIXTURE $LSAME $XERBLA -o $LEVEL2$GBMV$GEN $L $I
test -f $LEVEL2$GBMV$GEN && $LEVEL2$GBMV$GEN
test -f $LEVEL2$GBMV$GEN && rm $LEVEL2$GBMV$GEN
gfortran $LEVEL2C$GBMV/z$GBMV.f $LEVEL2C$GBMV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$GBMV$GEN $L $I
test -f $LEVEL2C$GBMV$GEN && $LEVEL2C$GBMV$GEN
test -f $LEVEL2C$GBMV$GEN && rm $LEVEL2C$GBMV$GEN

GEMV=gemv
gfortran $LEVEL2$GEMV/d$GEMV.f $LEVEL2$GEMV$FIXTURE $LSAME $XERBLA -o $LEVEL2$GEMV$GEN $L $I
test -f $LEVEL2$GEMV$GEN && $LEVEL2$GEMV$GEN
test -f $LEVEL2$GEMV$GEN && rm $LEVEL2$GEMV$GEN
gfortran $LEVEL2C$GEMV/z$GEMV.f $LEVEL2C$GEMV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$GEMV$GEN $L $I
test -f $LEVEL2C$GEMV$GEN && $LEVEL2C$GEMV$GEN
test -f $LEVEL2C$GEMV$GEN && rm $LEVEL2C$GEMV$GEN

GER=ger
gfortran $LEVEL2$GER/d$GER.f $LEVEL2$GER$FIXTURE $LSAME $XERBLA -o $LEVEL2$GER$GEN $L $I
test -f $LEVEL2$GER$GEN && $LEVEL2$GER$GEN
test -f $LEVEL2$GER$GEN && rm $LEVEL2$GER$GEN

GERC=gerc
gfortran $LEVEL2C$GERC/z$GERC.f $LEVEL2C$GERC$FIXTURE $LSAME $XERBLA -o $LEVEL2C$GERC$GEN $L $I
test -f $LEVEL2C$GERC$GEN && $LEVEL2C$GERC$GEN
test -f $LEVEL2C$GERC$GEN && rm $LEVEL2C$GERC$GEN

GERU=geru
gfortran $LEVEL2C$GERU/z$GERU.f $LEVEL2C$GERU$FIXTURE $LSAME $XERBLA -o $LEVEL2C$GERU$GEN $L $I
test -f $LEVEL2C$GERU$GEN && $LEVEL2C$GERU$GEN
test -f $LEVEL2C$GERU$GEN && rm $LEVEL2C$GERU$GEN

HBMV=hbmv
gfortran $LEVEL2C$HBMV/z$HBMV.f $LEVEL2C$HBMV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$HBMV$GEN $L $I
test -f $LEVEL2C$HBMV$GEN && $LEVEL2C$HBMV$GEN
test -f $LEVEL2C$HBMV$GEN && rm $LEVEL2C$HBMV$GEN

HEMV=hemv
gfortran $LEVEL2C$HEMV/z$HEMV.f $LEVEL2C$HEMV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$HEMV$GEN $L $I
test -f $LEVEL2C$HEMV$GEN && $LEVEL2C$HEMV$GEN
test -f $LEVEL2C$HEMV$GEN && rm $LEVEL2C$HEMV$GEN

HER=her
gfortran $LEVEL2C$HER/z$HER.f $LEVEL2C$HER$FIXTURE $LSAME $XERBLA -o $LEVEL2C$HER$GEN $L $I
test -f $LEVEL2C$HER$GEN && $LEVEL2C$HER$GEN
test -f $LEVEL2C$HER$GEN && rm $LEVEL2C$HER$GEN

HER2=her2
gfortran $LEVEL2C$HER2/z$HER2.f $LEVEL2C$HER2$FIXTURE $LSAME $XERBLA -o $LEVEL2C$HER2$GEN $L $I
test -f $LEVEL2C$HER2$GEN && $LEVEL2C$HER2$GEN
test -f $LEVEL2C$HER2$GEN && rm $LEVEL2C$HER2$GEN

HPMV=hpmv
gfortran $LEVEL2C$HPMV/z$HPMV.f $LEVEL2C$HPMV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$HPMV$GEN $L $I
test -f $LEVEL2C$HPMV$GEN && $LEVEL2C$HPMV$GEN
test -f $LEVEL2C$HPMV$GEN && rm $LEVEL2C$HPMV$GEN

HPR=hpr
gfortran $LEVEL2C$HPR/z$HPR.f $LEVEL2C$HPR$FIXTURE $LSAME $XERBLA -o $LEVEL2C$HPR$GEN $L $I
test -f $LEVEL2C$HPR$GEN && $LEVEL2C$HPR$GEN
test -f $LEVEL2C$HPR$GEN && rm $LEVEL2C$HPR$GEN

HPR2=hpr2
gfortran $LEVEL2C$HPR2/z$HPR2.f $LEVEL2C$HPR2$FIXTURE $LSAME $XERBLA -o $LEVEL2C$HPR2$GEN $L $I
test -f $LEVEL2C$HPR2$GEN && $LEVEL2C$HPR2$GEN
test -f $LEVEL2C$HPR2$GEN && rm $LEVEL2C$HPR2$GEN

SBMV=sbmv
gfortran $LEVEL2$SBMV/d$SBMV.f $LEVEL2$SBMV$FIXTURE $LSAME $XERBLA -o $LEVEL2$SBMV$GEN $L $I
test -f $LEVEL2$SBMV$GEN && $LEVEL2$SBMV$GEN
test -f $LEVEL2$SBMV$GEN && rm $LEVEL2$SBMV$GEN

SPMV=spmv
gfortran $LEVEL2$SPMV/d$SPMV.f $LEVEL2$SPMV$FIXTURE $LSAME $XERBLA -o $LEVEL2$SPMV$GEN $L $I
test -f $LEVEL2$SPMV$GEN && $LEVEL2$SPMV$GEN
test -f $LEVEL2$SPMV$GEN && rm $LEVEL2$SPMV$GEN

SPR=spr
gfortran $LEVEL2$SPR/d$SPR.f $LEVEL2$SPR$FIXTURE $LSAME $XERBLA -o $LEVEL2$SPR$GEN $L $I
test -f $LEVEL2$SPR$GEN && $LEVEL2$SPR$GEN
test -f $LEVEL2$SPR$GEN && rm $LEVEL2$SPR$GEN

SPR2=spr2
gfortran $LEVEL2$SPR2/d$SPR2.f $LEVEL2$SPR2$FIXTURE $LSAME $XERBLA -o $LEVEL2$SPR2$GEN $L $I
test -f $LEVEL2$SPR2$GEN && $LEVEL2$SPR2$GEN
test -f $LEVEL2$SPR2$GEN && rm $LEVEL2$SPR2$GEN

SYMV=symv
gfortran $LEVEL2$SYMV/d$SYMV.f $LEVEL2$SYMV$FIXTURE $LSAME $XERBLA -o $LEVEL2$SYMV$GEN $L $I
test -f $LEVEL2$SYMV$GEN && $LEVEL2$SYMV$GEN
test -f $LEVEL2$SYMV$GEN && rm $LEVEL2$SYMV$GEN

SYR=syr
gfortran $LEVEL2$SYR/d$SYR.f $LEVEL2$SYR$FIXTURE $LSAME $XERBLA -o $LEVEL2$SYR$GEN $L $I
test -f $LEVEL2$SYR$GEN && $LEVEL2$SYR$GEN
test -f $LEVEL2$SYR$GEN && rm $LEVEL2$SYR$GEN

SYR2=syr2
gfortran $LEVEL2$SYR2/d$SYR2.f $LEVEL2$SYR2$FIXTURE $LSAME $XERBLA -o $LEVEL2$SYR2$GEN $L $I
test -f $LEVEL2$SYR2$GEN && $LEVEL2$SYR2$GEN
test -f $LEVEL2$SYR2$GEN && rm $LEVEL2$SYR2$GEN

TBMV=tbmv
gfortran $LEVEL2$TBMV/d$TBMV.f $LEVEL2$TBMV$FIXTURE $LSAME $XERBLA -o $LEVEL2$TBMV$GEN $L $I
test -f $LEVEL2$TBMV$GEN && $LEVEL2$TBMV$GEN
test -f $LEVEL2$TBMV$GEN && rm $LEVEL2$TBMV$GEN
gfortran $LEVEL2C$TBMV/z$TBMV.f $LEVEL2C$TBMV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$TBMV$GEN $L $I
test -f $LEVEL2C$TBMV$GEN && $LEVEL2C$TBMV$GEN
test -f $LEVEL2C$TBMV$GEN && rm $LEVEL2C$TBMV$GEN

TBSV=tbsv
gfortran $LEVEL2$TBSV/d$TBSV.f $LEVEL2$TBSV$FIXTURE $LSAME $XERBLA -o $LEVEL2$TBSV$GEN $L $I
test -f $LEVEL2$TBSV$GEN && $LEVEL2$TBSV$GEN
test -f $LEVEL2$TBSV$GEN && rm $LEVEL2$TBSV$GEN
gfortran $LEVEL2C$TBSV/z$TBSV.f $LEVEL2C$TBSV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$TBSV$GEN $L $I
test -f $LEVEL2C$TBSV$GEN && $LEVEL2C$TBSV$GEN
test -f $LEVEL2C$TBSV$GEN && rm $LEVEL2C$TBSV$GEN

TPMV=tpmv
gfortran $LEVEL2$TPMV/d$TPMV.f $LEVEL2$TPMV$FIXTURE $LSAME $XERBLA -o $LEVEL2$TPMV$GEN $L $I
test -f $LEVEL2$TPMV$GEN && $LEVEL2$TPMV$GEN
test -f $LEVEL2$TPMV$GEN && rm $LEVEL2$TPMV$GEN
gfortran $LEVEL2C$TPMV/z$TPMV.f $LEVEL2C$TPMV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$TPMV$GEN $L $I
test -f $LEVEL2C$TPMV$GEN && $LEVEL2C$TPMV$GEN
test -f $LEVEL2C$TPMV$GEN && rm $LEVEL2C$TPMV$GEN

TPSV=tpsv
gfortran $LEVEL2$TPSV/d$TPSV.f $LEVEL2$TPSV$FIXTURE $LSAME $XERBLA -o $LEVEL2$TPSV$GEN $L $I
test -f $LEVEL2$TPSV$GEN && $LEVEL2$TPSV$GEN
test -f $LEVEL2$TPSV$GEN && rm $LEVEL2$TPSV$GEN
gfortran $LEVEL2C$TPSV/z$TPSV.f $LEVEL2C$TPSV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$TPSV$GEN $L $I
test -f $LEVEL2C$TPSV$GEN && $LEVEL2C$TPSV$GEN
test -f $LEVEL2C$TPSV$GEN && rm $LEVEL2C$TPSV$GEN

TRMV=trmv
gfortran $LEVEL2$TRMV/d$TRMV.f $LEVEL2$TRMV$FIXTURE $LSAME $XERBLA -o $LEVEL2$TRMV$GEN $L $I
test -f $LEVEL2$TRMV$GEN && $LEVEL2$TRMV$GEN
test -f $LEVEL2$TRMV$GEN && rm $LEVEL2$TRMV$GEN
gfortran $LEVEL2C$TRMV/z$TRMV.f $LEVEL2C$TRMV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$TRMV$GEN $L $I
test -f $LEVEL2C$TRMV$GEN && $LEVEL2C$TRMV$GEN
test -f $LEVEL2C$TRMV$GEN && rm $LEVEL2C$TRMV$GEN

TRSV=trsv
gfortran $LEVEL2$TRSV/d$TRSV.f $LEVEL2$TRSV$FIXTURE $LSAME $XERBLA -o $LEVEL2$TRSV$GEN $L $I
test -f $LEVEL2$TRSV$GEN && $LEVEL2$TRSV$GEN
test -f $LEVEL2$TRSV$GEN && rm $LEVEL2$TRSV$GEN
gfortran $LEVEL2C$TRSV/z$TRSV.f $LEVEL2C$TRSV$FIXTURE $LSAME $XERBLA -o $LEVEL2C$TRSV$GEN $L $I
test -f $LEVEL2C$TRSV$GEN && $LEVEL2C$TRSV$GEN
test -f $LEVEL2C$TRSV$GEN && rm $LEVEL2C$TRSV$GEN

LEVEL3=./tests/conformance/level3/
LEVEL3C=./tests/conformance/level3/complex/

GEMM=gemm
gfortran $LEVEL3$GEMM/d$GEMM.f $LEVEL3$GEMM$FIXTURE $LSAME $XERBLA -o $LEVEL3$GEMM$GEN $L $I
test -f $LEVEL3$GEMM$GEN && $LEVEL3$GEMM$GEN
test -f $LEVEL3$GEMM$GEN && rm $LEVEL3$GEMM$GEN
gfortran $LEVEL3C$GEMM/z$GEMM.f $LEVEL3C$GEMM$FIXTURE $LSAME $XERBLA -o $LEVEL3C$GEMM$GEN $L $I
test -f $LEVEL3C$GEMM$GEN && $LEVEL3C$GEMM$GEN
test -f $LEVEL3C$GEMM$GEN && rm $LEVEL3C$GEMM$GEN

HEMM=hemm
gfortran $LEVEL3C$HEMM/z$HEMM.f $LEVEL3C$HEMM$FIXTURE $LSAME $XERBLA -o $LEVEL3C$HEMM$GEN $L $I
test -f $LEVEL3C$HEMM$GEN && $LEVEL3C$HEMM$GEN
test -f $LEVEL3C$HEMM$GEN && rm $LEVEL3C$HEMM$GEN

HERK=herk
gfortran $LEVEL3C$HERK/z$HERK.f $LEVEL3C$HERK$FIXTURE $LSAME $XERBLA -o $LEVEL3C$HERK$GEN $L $I
test -f $LEVEL3C$HERK$GEN && $LEVEL3C$HERK$GEN
test -f $LEVEL3C$HERK$GEN && rm $LEVEL3C$HERK$GEN

HER2K=her2k
gfortran $LEVEL3C$HER2K/z$HER2K.f $LEVEL3C$HER2K$FIXTURE $LSAME $XERBLA -o $LEVEL3C$HER2K$GEN $L $I
test -f $LEVEL3C$HER2K$GEN && $LEVEL3C$HER2K$GEN
test -f $LEVEL3C$HER2K$GEN && rm $LEVEL3C$HER2K$GEN

SYMM=symm
gfortran $LEVEL3$SYMM/d$SYMM.f $LEVEL3$SYMM$FIXTURE $LSAME $XERBLA -o $LEVEL3$SYMM$GEN $L $I
test -f $LEVEL3$SYMM$GEN && $LEVEL3$SYMM$GEN
test -f $LEVEL3$SYMM$GEN && rm $LEVEL3$SYMM$GEN
gfortran $LEVEL3C$SYMM/z$SYMM.f $LEVEL3C$SYMM$FIXTURE $LSAME $XERBLA -o $LEVEL3C$SYMM$GEN $L $I
test -f $LEVEL3C$SYMM$GEN && $LEVEL3C$SYMM$GEN
test -f $LEVEL3C$SYMM$GEN && rm $LEVEL3C$SYMM$GEN

SYRK=syrk
gfortran $LEVEL3$SYRK/d$SYRK.f $LEVEL3$SYRK$FIXTURE $LSAME $XERBLA -o $LEVEL3$SYRK$GEN $L $I
test -f $LEVEL3$SYRK$GEN && $LEVEL3$SYRK$GEN
test -f $LEVEL3$SYRK$GEN && rm $LEVEL3$SYRK$GEN
gfortran $LEVEL3C$SYRK/z$SYRK.f $LEVEL3C$SYRK$FIXTURE $LSAME $XERBLA -o $LEVEL3C$SYRK$GEN $L $I
test -f $LEVEL3C$SYRK$GEN && $LEVEL3C$SYRK$GEN
test -f $LEVEL3C$SYRK$GEN && rm $LEVEL3C$SYRK$GEN

SYR2K=syr2k
gfortran $LEVEL3$SYR2K/d$SYR2K.f $LEVEL3$SYR2K$FIXTURE $LSAME $XERBLA -o $LEVEL3$SYR2K$GEN $L $I
test -f $LEVEL3$SYR2K$GEN && $LEVEL3$SYR2K$GEN
test -f $LEVEL3$SYR2K$GEN && rm $LEVEL3$SYR2K$GEN
gfortran $LEVEL3C$SYR2K/z$SYR2K.f $LEVEL3C$SYR2K$FIXTURE $LSAME $XERBLA -o $LEVEL3C$SYR2K$GEN $L $I
test -f $LEVEL3C$SYR2K$GEN && $LEVEL3C$SYR2K$GEN
test -f $LEVEL3C$SYR2K$GEN && rm $LEVEL3C$SYR2K$GEN

TRMM=trmm
gfortran $LEVEL3$TRMM/d$TRMM.f $LEVEL3$TRMM$FIXTURE $LSAME $XERBLA -o $LEVEL3$TRMM$GEN $L $I
test -f $LEVEL3$TRMM$GEN && $LEVEL3$TRMM$GEN
test -f $LEVEL3$TRMM$GEN && rm $LEVEL3$TRMM$GEN
gfortran $LEVEL3C$TRMM/z$TRMM.f $LEVEL3C$TRMM$FIXTURE $LSAME $XERBLA -o $LEVEL3C$TRMM$GEN $L $I
test -f $LEVEL3C$TRMM$GEN && $LEVEL3C$TRMM$GEN
test -f $LEVEL3C$TRMM$GEN && rm $LEVEL3C$TRMM$GEN

TRSM=trsm
gfortran $LEVEL3$TRSM/d$TRSM.f $LEVEL3$TRSM$FIXTURE $LSAME $XERBLA -o $LEVEL3$TRSM$GEN $L $I
test -f $LEVEL3$TRSM$GEN && $LEVEL3$TRSM$GEN
test -f $LEVEL3$TRSM$GEN && rm $LEVEL3$TRSM$GEN
gfortran $LEVEL3C$TRSM/z$TRSM.f $LEVEL3C$TRSM$FIXTURE $LSAME $XERBLA -o $LEVEL3C$TRSM$GEN $L $I
test -f $LEVEL3C$TRSM$GEN && $LEVEL3C$TRSM$GEN
test -f $LEVEL3C$TRSM$GEN && rm $LEVEL3C$TRSM$GEN


MATRIX=./tests/conformance/matrix
SLICE=/slice.f90
PACK=/pack.f90
gfortran $MATRIX$SLICE -o $MATRIX$GEN $L $I
test -f $MATRIX$GEN && $MATRIX$GEN
test -f $MATRIX$GEN && rm $MATRIX$GEN
gfortran $MATRIX$PACK -o $MATRIX$GEN $L $I
test -f $MATRIX$GEN && $MATRIX$GEN
test -f $MATRIX$GEN && rm $MATRIX$GEN




