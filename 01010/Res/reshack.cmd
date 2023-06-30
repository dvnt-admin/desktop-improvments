@echo off
rem set PATH=%SystemRoot%\system32;"%~dp0"
if not exist imageres.dll.mun.res exit /b
:: make index
for /f "delims=:" %%a in ('findstr /b /n ":::" %~n0.cmd') do set "line=%%a"
(for /f "skip=%line% tokens=*" %%a in (%~n0.cmd) do echo %%a)>index.ini
:: copy .ico
for /f "tokens=1,2 delims= " %%a in ('type index.ini') do copy tmp\%%a.ico %%b.ico >nul
for /l %%x in (0,1,9999) do copy tmp\%%x.ico >nul
:: make .ini
(
echo [FILENAMES]
echo Open=imageres.dll.mun.res
echo SaveAs=new.res
echo Log=CON
echo.
echo [COMMANDS]
for %%f in (*.ico) do echo -addoverwrite %%f, ICONGROUP, %%~nf
echo -changelanguage(1033^)
)>res.ini
cls
ResHacker.exe -script res.ini
move /y new.res imageres.dll.mun.res >nul
del *.ico
del *.ini
timeout 2 >nul
exit /b
::: index :::
computer 109
desktop 110
disc 5205
disc 61
drive 1030
drive 32
drive-c 1033
drive-c 36
drive-err 1032
drive-err 1034
drive-lock 1031
drive-net 143
drive-net 73
drive-optic 30
drive-optic 37
drive-usb 35
explorer 1023
explorer 5325
folder 162
folder 3
folder 4
folder-cloud 1040
folder-desktop 183
folder-dl 184
folder-docs 112
folder-drafts 198
folder-search 1025
folder-games 186
folder-home 123
folder-home 181
folder-music 108
folder-net 73
folder-net 74
folder-net 143
folder-pics 113
folder-vids 189
network 25
starred 1024
trash 55
trash-full 54
-drive-cd 30
-drive-dvd 37
folder-anime 1020
folder-docs 1002
folder-music 1004
folder-pics 1003
folder-rec 1008
folder-tmp 1001
folder-tmp 1014
folder-vids 1005
