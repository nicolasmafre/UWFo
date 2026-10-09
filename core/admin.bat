@echo off
net session >nul 2>&1
if %errorLevel% equ 0 (
    call "rede\metrica.bat"
    exit /b 0
) else (
    echo Solicitando privilégios de Administrador...
    powershell -Command "Start-Process -FilePath '%BASE_DIR%uwfo.bat' -Verb RunAs"
    exit /b 1
)