:: This script requires Magick.exe
:: https://imagemagick.org/script/download.php#windows
@echo off
rem set PATH=%SystemRoot%\system32;"%~dp0"
pushd "%~dp0"
goto :color
:color
set "LSH=100,90,0"
set "ops=-background none -set option:modulate:colorspace hsl -modulate %LSH%"
mkdir "%LSH%"
for %%f in (*.ico) do magick convert -compress zip %ops% "%%f" "%LSH%\%%f"
exit /b
:dark
mkdir tmp
for %%f in (com* drive* folder-* network* starred*) do (
	pushd tmp
	magick convert "..\%%f" "%%~nf.png"
	magick mogrify -modulate 50,100,100 -channel RGB -negate "%%~nf-4.png"
	magick mogrify -modulate 50,100,100 -channel RGB -negate "%%~nf-5.png"
	rem copy /y "new\%%~nf-4.png"
	rem copy /y "new\%%~nf-5.png"
	magick convert -compress zip *.png "%%f"
	del *.png
	popd
)
