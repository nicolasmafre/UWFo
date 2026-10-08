@echo off

for /f %%A in (
'PowerShell -Command "Get-Date -Format yyyyMMdd"'
) do set DATA=%%A

set LOG=%~dp0..\logs\%DATA%\limpeza.log

echo Limpando...

del /q /f /s "%TEMP%\*.*" >nul 2>&1

del /q /f /s "C:\Windows\Temp\*.*" >nul 2>&1

del /q /f /s "C:\Windows\Prefetch\*.*" >nul 2>&1

ipconfig /flushdns >nul

echo Limpeza concluida.

pause

exit /b