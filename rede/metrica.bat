@echo off
:: Altera a métrica de interfaces de rede físicas ativas para 10
powershell -NoProfile -Command "Get-NetAdapter | Where-Object { $_.Status -eq 'Up' -and $_.Virtual -eq $false } | Set-NetIPInterface -InterfaceMetric 10" >nul 2>&1
call "%BASE_DIR%core\logger.bat" "INFO" "Metricas de interfaces fisicas ativas configuradas para 10" "rede.log"