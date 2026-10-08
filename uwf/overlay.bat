@echo off

for /f %%A in (
'PowerShell -Command "Get-Date -Format yyyyMMdd"'
) do set DATA=%%A

set LOG=%~dp0..\logs\%DATA%\overlay.log

cls

echo 1 = 20 GB
echo 2 = 25 GB
echo 3 = Mostrar

set /p op=Opcao:

if "%op%"=="1" (

 uwfmgr overlay set-size 20480

)

if "%op%"=="2" (

 uwfmgr overlay set-size 25600

)

if "%op%"=="3" (

 uwfmgr overlay get-config

)

pause

exit /b