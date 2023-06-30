:: This script requires Magick.exe
:: https://imagemagick.org/script/download.php#windows
@echo off
setlocal enableDelayedExpansion
pushd tmp
for %%f in ("*16.png") do (
	for %%s in (16 24 32 48 64 256) do (
		set file=%%f
		set file=!File:16x16=%%sx%%s!
		copy !file! ..\
	)
	echo %%f
	popd
	magick convert -compress zip *.png %%~nf.ico
	del *.png >nul
	pushd tmp
)
