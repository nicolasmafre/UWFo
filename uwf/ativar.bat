@echo off
cls
echo ============================================================
echo          PROTECAO: PREPARANDO ATIVACAO DO UWF
echo ============================================================
call "%BASE_DIR%core\logger.bat" "INFO" "Iniciando processo de ativacao do UWF" "ativacao.log"

powercfg /HIBERNATE OFF
call "%BASE_DIR%manutencao\updates.bat" "DESATIVAR"
call "%BASE_DIR%manutencao\limpeza.bat" "AUTO"
call "%BASE_DIR%uwf\overlay.bat" "AUTO"
call "%BASE_DIR%uwf\exclusoes.bat" "SYNC"

echo.
echo Verificando regras de Firewall para o LanSchool...
:: O LanSchool utiliza as portas TCP e UDP 796 para comunicacao com o Professor
netsh advfirewall firewall show rule name="LanSchool Student (TCP)" >nul 2>&1
if %errorLevel% neq 0 (
    netsh advfirewall firewall add rule name="LanSchool Student (TCP)" dir=in action=allow protocol=TCP localport=796 >nul 2>&1
    call "%BASE_DIR%core\logger.bat" "INFO" "Regra de Firewall TCP 796 criada para o LanSchool" "rede.log"
)

netsh advfirewall firewall show rule name="LanSchool Student (UDP)" >nul 2>&1
if %errorLevel% neq 0 (
    netsh advfirewall firewall add rule name="LanSchool Student (UDP)" dir=in action=allow protocol=UDP localport=796 >nul 2>&1
    call "%BASE_DIR%core\logger.bat" "INFO" "Regra de Firewall UDP 796 criada para o LanSchool" "rede.log"
)

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