:: This script requires Magick.exe
:: https://imagemagick.org/script/download.php#windows
@echo off
setlocal enableDelayedExpansion
del *.ico >nul
for %%f in ("*.svg") do (
	:: FIX BLURRING GRAVIT FILES
	fart %%f pt\" \"
	for %%s in (16 24 32 48 64 256) do (
		set file=%%f PNG32:%%~nf-%%s.png
		if "%%s" == "16" (
			set /a "size=%%s+2"
			set "ext=-trim -gravity center -extent %%sx%%s"
			magick convert -background none -size !size!x !ext! !file!
		) else (
			magick convert -background none -size %%sx !file!
		)
	)
	:: FIX A BUG WITH GRAYSCALE PALETTE
	rem magick convert -compress none *.png %%~nf.ico
	magick convert -compress zip *.png %%~nf.ico
	del *.png >nul
	echo %%f
)
