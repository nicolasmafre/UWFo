@echo off
:: Lê a configuração do INI para o Overlay. Caso arg1 seja "AUTO", não interage.
for /f "tokens=1,2 delims==" %%A in (%BASE_DIR%configs\config.ini) do (
    if "%%A"=="OverlaySizeMB" set "O_SIZE=%%B"
    if "%%A"=="OverlayWarnMB" set "O_WARN=%%B"
    if "%%A"=="OverlayCritMB" set "O_CRIT=%%B"
    if "%%A"=="OverlayType" set "O_TYPE=%%B"
)

if "%~1"=="AUTO" goto :ApplyOverlay

cls
echo ============================================================
echo          CONFIGURAÇÃO DE OVERLAY (VIA CONFIG.INI)
echo ============================================================
echo Valores lidos de config.ini:
echo Tipo: %O_TYPE%  |  Tamanho: %O_SIZE% MB
echo.
echo [1] Aplicar configuracao acima
echo [2] Voltar
set /p ovop="Opcao: "
if "%ovop%"=="2" exit /b

:ApplyOverlay
uwfmgr overlay set-type %O_TYPE% >nul
uwfmgr overlay set-size %O_SIZE% >nul
uwfmgr overlay set-warningthreshold %O_WARN% >nul
uwfmgr overlay set-criticalthreshold %O_CRIT% >nul
call "%BASE_DIR%core\logger.bat" "INFO" "Overlay configurado: %O_SIZE%MB (%O_TYPE%)" "ativacao.log"
if not "%~1"=="AUTO" (
    echo Overlay aplicado com sucesso!
    pause
)