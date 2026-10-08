@echo off

for /f %%A in (
'PowerShell -Command "Get-Date -Format yyyyMMdd"'
) do set DATA=%%A

set LOG=%~dp0..\logs\%DATA%\updates.log

echo Atualizando Defender...

powershell -command "Update-MpSignature"

net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1

sc config wuauserv start= disabled
sc config bits start= disabled

exit /b