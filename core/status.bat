@echo off

cls

echo Verificando sistema...
echo.

for /f "tokens=3*" %%A in (
'reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName'
) do set "WinEd=%%A %%B"

echo Windows:
echo %WinEd%

echo.
echo UWF:
uwfmgr filter get-config

echo.
echo Overlay:
uwfmgr overlay get-config

echo.
echo Exclusoes:
uwfmgr file get-exclusions

echo.
echo Registro:
uwfmgr registry get-exclusions

echo.
echo Rede:
netsh interface ipv4 show interface

pause
exit /b
``