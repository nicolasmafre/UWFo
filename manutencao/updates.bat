@echo off
if "%~1"=="DESATIVAR" (
    echo Atualizando Defender antes de isolar...
    powershell -Command "Update-MpSignature" >nul 2>&1
    net stop wuauserv >nul 2>&1
    net stop bits >nul 2>&1
    sc config wuauserv start= disabled >nul 2>&1
    sc config bits start= disabled >nul 2>&1
    call "%BASE_DIR%core\logger.bat" "INFO" "Windows Update Desativado e Defender Atualizado" "manutencao.log"
) else if "%~1"=="ATIVAR" (
    sc config wuauserv start= demand >nul 2>&1
    sc config bits start= demand >nul 2>&1
    net start wuauserv >nul 2>&1
    net start bits >nul 2>&1
    call "%BASE_DIR%core\logger.bat" "INFO" "Servicos do Windows Update Restaurados" "manutencao.log"
)