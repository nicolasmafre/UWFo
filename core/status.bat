@echo off
cls
echo ============================================================
echo          VERIFICAÇÃO DE STATUS UWF E SISTEMA
echo ============================================================
call "%BASE_DIR%core\logger.bat" "INFO" "Status do sistema consultado" "uwfo.log"

echo [1/3] Edição do Windows...
for /f "tokens=3*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName 2^>nul') do set "WinEd=%%a %%b"
echo Detectada: %WinEd%
echo.

echo [2/3] Status do UWFMgr...
where uwfmgr >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERRO] UWF NAO ESTA INSTALADO!
    call "%BASE_DIR%core\logger.bat" "ERROR" "UWF nao detectado no sistema." "erros.log"
    pause
    exit /b
)

echo [3/3] Configurações Atuais (Filtro e Overlay)...
uwfmgr filter get-config
echo.
uwfmgr overlay get-config
pause