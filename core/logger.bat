@echo off



for /f %%A in (
'PowerShell -Command "Get-Date -Format yyyyMMdd"'
) do set DATA=%%A

set LOG=%~dp0..\logs\%DATA%\logs.log

if not exist "%LOGDIR%" (
    mkdir "%LOGDIR%"
)

exit /b