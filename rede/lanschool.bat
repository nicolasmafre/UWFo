@echo off

for /f %%A in (
'PowerShell -Command "Get-Date -Format yyyyMMdd"'
) do set DATA=%%A

set LOG=%~dp0..\logs\%DATA%\lanschool.log

echo ===== LANSCHOOL ===== > "%LOG%"

ipconfig /all >> "%LOG%"

route print >> "%LOG%"

netsh interface ipv4 show interface >> "%LOG%"

sc query state= all >> "%LOG%"

echo.
echo Diagnostico salvo em:
echo %LOG%

pause
exit /b