@echo off
rem set PATH=%SystemRoot%\system32;"%~dp0"
setlocal EnableDelayedExpansion
for %%f in (*.res) do (
	mkdir _%%f
	pushd _%%f
	ResHacker.exe -open ..\%%f -save res.rc -action extract -mask ICONGROUP,,
		for %%i in (*.ico) do (
		set "n=%%~ni"
		set "n=!n:~4,-2!"
		ren %%i "!n!.ico"
	)
	popd
)
