@echo off
cls
echo ============================================================
echo        MANUTENÇÃO: DESATIVANDO FILTRO UWF
echo ============================================================
call "%BASE_DIR%core\logger.bat" "INFO" "Iniciando processo de desativacao" "manutencao.log"

call "%BASE_DIR%manutencao\updates.bat" "ATIVAR"

uwfmgr filter disable >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERRO] Falha ao desativar UWF.
    call "%BASE_DIR%core\logger.bat" "ERROR" "Falha ao executar uwfmgr filter disable" "erros.log"
    pause
    exit /b
)

call "%BASE_DIR%core\logger.bat" "SUCESSO" "UWF desativado com sucesso" "manutencao.log"
echo.
echo Filtro DESATIVADO! Reinicie o computador para manutencao.
pause