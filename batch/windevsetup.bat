@echo off
rem golobal path define
set IDEV_HOME=c:\devtools

rem param parse and configuration
rem default arch is amd64
set ARCH=amd64
set PY_VER=3.4.2
if /i "%1" == "x86"       set ARCH=x86
if /i "%2" == "2.7.8"     set PY_VER=%2

rem qt related configuration
rem set QT_ARCH=_64
rem if /i %ARCH% == x86     set QT_ARCH=
rem set QT_VER=5.3.2
rem set QT_MAJOR_VER=5.3
rem set QT_HOME=%IDEV_HOME%\Qt\%ARCH%\Qt%QT_VER%\%QT_MAJOR_VER%\msvc2013%QT_ARCH%
rem set PATH=%QT_HOME%\bin;%PATH%
rem set INCLUDE=%QT_HOME%\include;%QT_HOME%\include\QtPrintSupport;%INCLUDE%
rem set LIB=%QT_HOME%\lib;%LIB%
rem set LIBPATH=%QT_HOME%\lib;%LIBPATH%

rem add python to path
set PYTHON_HOME=%IDEV_HOME%\Python\%ARCH%\%PY_VER%
set PATH=%PYTHON_HOME%;%PATH%
set INCLUDE=%PYTHON_HOME%\include;%INCLUDE%
set LIB=%PYTHON_HOME%\libs;%LIB%
set LIBPATH=%PYTHON_HOME%\libs;%LIBPATH%
set PYTHONHOME=%PYTHON_HOME%\Lib;
set PYTHONPATH=%PYTHONHOME%

rem add 3rdparty to path
set TRDPTY_HOME=%IDEV_HOME%\3rdparty
set PATH=%TRDPTY_HOME%\%ARCH%\bin;%PATH%
set INCLUDE=%TRDPTY_HOME%\%ARCH%\include;%INCLUDE%
set LIB=%TRDPTY_HOME%\%ARCH%\lib;%LIB%
set LIBPATH=%TRDPTY_HOME%\%ARCH%\lib;%LIBPATH%

rem perl configuration, ripped from portbalperl.bat
set PERL_HOME=%IDEV_HOME%\perl\%ARCH%
set PATH=%PERL_HOME%\perl\site\bin;%PERL_HOME%\perl\bin;%PATH%
rem perl env variables
set TERM=
set HOME=%PERL_HOME%\data
set PLPLOT_LIB=%PERL_HOME%\c\share\plplot
set PLPLOT_DRV_DIR=%PERL_HOME%\c\share\plplot
rem avoid collisions with other perl stuff on your system
set PERL_JSON_BACKEND=
set PERL_YAML_BACKEND=
set PERL5LIB=
set PERL5OPT=
set PERL_MM_OPT=
set PERL_MB_OPT=
perl -MConfig -MPDL -e "printf("""Perl executable: %%s\nPerl version   : %%vd / $Config{archname}\nPDL version    : %%s\n""", $^X, $^V, $PDL::VERSION)" 2>nul
if ERRORLEVEL==1 echo.&echo FATAL ERROR: 'perl' does not work; check if your strawberry pack is complete!

rem mingw configuration
set MINGW_HOME=%IDEV_HOME%\MinGW\%ARCH%
set PATH=%MINGW_HOME%\bin;%PATH%

rem add hg to $PATH
set HG_HOME=%IDEV_HOME%\mercurial
set PATH=%HG_HOME%;%PATH%

rem add svn to $PATH
set SVN_HOME=%IDEV_HOME%\TortoiseSVN
set PATH=%SVN_HOME%\bin;%PATH%

rem add nasm to path
set NASM_HOME=%IDEV_HOME%\nasm
set NASM_VER=2.11.05
set PATH=%NASM_HOME%\%NASM_VER%;%NASM_HOME%\%NASM_VER%\rdoff;%PATH%

rem add tcc to path
set TCC_HOME=%IDEV_HOME%\tcc
set PATH=%TCC_HOME%\%ARCH%;%PATH%

rem add pdftk to path
set PDFTK_HOME=%IDEV_HOME%\PDFtk
set PATH=%PDFTK_HOME%\bin;%PATH%


rem add ImageMagick to path
set IMG_MAGIK_VER=6.8.9-Q16
set IMG_MAGIK_HOME=%IDEV_HOME%\ImageMagick\%IMG_MAGIK_VER%
set PATH=%IMG_MAGIK_HOME%;%PATH%

rem add potrace to ptath
set PATH=%IDEV_HOME%\potrace;%PATH%
set PATH=%IDEV_HOME%\autotrace;%PATH%
