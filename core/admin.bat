@echo off

net session >nul 2>&1

if %errorlevel% neq 0 (

 powershell -command ^
 "Start-Process '%~dp0..\uwfo.bat' -Verb RunAs"

 exit

)

call "%~dp0..\rede\metrica.bat"

exit /b