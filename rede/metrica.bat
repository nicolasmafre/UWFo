@echo off
:: Altera a métrica apenas de adaptadores FÍSICOS que estão Conectados
powershell -NoProfile -Command "Get-NetAdapter -Physical | Where-Object Status -eq 'Up' | Set-NetIPInterface -InterfaceMetric 10" >nul 2>&1
call "%BASE_DIR%core\logger.bat" "INFO" "Metricas de rede ajustadas." "rede.log"