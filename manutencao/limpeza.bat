@echo off
echo Executando limpeza de sistema (Temp, Prefetch, DNS)...
del /q /f /s "%TEMP%\*.*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*.*" >nul 2>&1
del /q /f /s "C:\Windows\Prefetch\*.*" >nul 2>&1
ipconfig /flushdns >nul 2>&1

call "%BASE_DIR%core\logger.bat" "INFO" "Limpeza de sistema executada" "manutencao.log"
if "%~1"=="MANUAL" (
    echo Limpeza concluida!
    pause
)