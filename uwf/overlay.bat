@echo off
:: Verifica se o arquivo config.ini existe
if not exist "configs\config.ini" (
    cls
    echo ============================================================
    echo [ERRO] Arquivo de configuracao nao encontrado!
    echo Caminho esperado: configs\config.ini
    echo ============================================================
    pause
    exit /b
)

:: Lê a configuração do INI com tratamento de falhas
set "O_SIZE=Nao definido"
set "O_TYPE=Nao definido"

for /f "usebackq tokens=1,2 delims==" %%A in ("configs\config.ini") do (
    if /I "%%A"=="OverlaySizeMB" set "O_SIZE=%%B"
    if /I "%%A"=="OverlayWarnMB" set "O_WARN=%%B"
    if /I "%%A"=="OverlayCritMB" set "O_CRIT=%%B"
    if /I "%%A"=="OverlayType" set "O_TYPE=%%B"
)

if "%~1"=="AUTO" goto :ApplyOverlay

cls
echo ============================================================
echo          CONFIGURACAO DE OVERLAY (VIA CONFIG.INI)
echo ============================================================
echo Valores lidos de config.ini:
echo Tipo: %O_TYPE%  ^|  Tamanho: %O_SIZE% MB
echo.
echo [1] Aplicar configuracao acima
echo [2] Voltar
echo.
set "ovop="
set /p ovop="Opcao: "
if "%ovop%"=="2" exit /b
if not "%ovop%"=="1" exit /b

:ApplyOverlay
echo Aplicando configuracoes no UWF...
uwfmgr overlay set-type %O_TYPE% >nul 2>&1
uwfmgr overlay set-size %O_SIZE% >nul 2>&1
uwfmgr overlay set-warningthreshold %O_WARN% >nul 2>&1
uwfmgr overlay set-criticalthreshold %O_CRIT% >nul 2>&1

call "core\logger.bat" "INFO" "Overlay configurado: %O_SIZE%MB (%O_TYPE%)" "ativacao.log"

if not "%~1"=="AUTO" (
    echo.
    echo Overlay aplicado com sucesso! Requer reinicializacao para surtir efeito.
    pause
)