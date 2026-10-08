@echo off

for /f %%A in (
'PowerShell -Command "Get-Date -Format yyyyMMdd"'
) do set DATA=%%A

set LOG=%~dp0..\logs\%DATA%\desativarUWF.log

echo Desativando UWF...

sc config wuauserv start= demand
sc config bits start= demand

net start wuauserv
net start bits

uwfmgr filter disable

pause

exit /b