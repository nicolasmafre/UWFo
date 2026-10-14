@echo off
cls
echo ============================================================
echo          VERIFICACAO DE STATUS UWF E SISTEMA
echo ============================================================
call "%BASE_DIR%core\logger.bat" "INFO" "Status do sistema consultado" "uwfo.log"

echo [1/3] Edicao do Windows...
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
) else (
    echo [OK] O recurso UWF esta instalado e acessivel.
)
echo.

echo [3/3] Configuracoes Atuais (Filtro e Overlay)...
uwfmgr filter get-config
echo.
uwfmgr overlay get-config
pause