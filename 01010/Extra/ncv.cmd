:: This script requires nconvert.exe
:: https://download.xnview.com/NConvert-win64.zip
@echo off
rem set PATH=%SystemRoot%\system32;"%~dp0"
pushd "%~dp0"
goto :dark
:color
set HLS=50 0 0
mkdir Hue
for %%f in (*.ico) do (
	nconvert -xall -out png "%%f"
	nconvert -o "Hue\%%f" -out ico -overwrite -hls %HLS% -multi *.png
del *.png)
exit /b
:dark
mkdir tmp
for %%f in (com* drive* folder-* network* starred* trash*) do (
	nconvert -xall -out png "%%f"
	nconvert -hls 0 -15 0 -negate -out png -overwrite "%%~nf-4.png"
	nconvert -hls 0 -15 0 -negate -out png -overwrite "%%~nf-5.png"
	nconvert -o "tmp\%%f" -out ico -multi *.png
del *.png)
exit /b
