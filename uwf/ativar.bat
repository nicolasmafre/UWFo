@echo off
cls
echo ============================================================
echo          PROTEÇÃO: PREPARANDO ATIVAÇÃO DO UWF
echo ============================================================
call "%BASE_DIR%core\logger.bat" "INFO" "Iniciando processo de ativacao do UWF" "ativacao.log"

powercfg /HIBERNATE OFF
call "%BASE_DIR%manutencao\updates.bat" "DESATIVAR"
call "%BASE_DIR%manutencao\limpeza.bat" "AUTO"
call "%BASE_DIR%uwf\overlay.bat" "AUTO"
call "%BASE_DIR%uwf\exclusoes.bat" "SYNC"

echo.
echo Ativando o filtro...
uwfmgr filter enable >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERRO] Falha ao ativar UWF.
    call "%BASE_DIR%core\logger.bat" "ERROR" "Falha ao executar uwfmgr filter enable" "ativacao.log"
    pause
    exit /b
)

call "%BASE_DIR%core\logger.bat" "SUCESSO" "UWF programado para ativar no proximo boot" "ativacao.log"
echo.
echo Filtro ATIVADO! Reinicie o computador para aplicar.
pause