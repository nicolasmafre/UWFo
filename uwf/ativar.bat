@echo off

for /f %%A in (
'PowerShell -Command "Get-Date -Format yyyyMMdd"'
) do set DATA=%%A

set LOG=%~dp0..\logs\%DATA%\ativarUWF.log

echo Ativando UWF...

call "%~dp0..\manutencao\updates.bat"

call "%~dp0..\manutencao\limpeza.bat"

call "%~dp0exclusoes.bat"

uwfmgr volume protect c:

uwfmgr overlay set-type DISK

uwfmgr overlay set-size 25600

uwfmgr overlay set-warningthreshold 22000

uwfmgr overlay set-criticalthreshold 24500

uwfmgr filter enable

if errorlevel 1 (

 echo ERRO AO ATIVAR

 pause

 exit /b

)

echo UWF habilitado.

pause

exit /b