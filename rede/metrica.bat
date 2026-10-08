@echo off
setlocal EnableDelayedExpansion

set "CONFIG=%~dp0..\configs\config.ini"

for /f %%A in (
'PowerShell -Command "Get-Date -Format yyyyMMdd"'
) do set DATA=%%A

set LOG=%~dp0..\logs\%DATA%\rede.log"

echo.>>"%LOG%"
echo =====================================================>>"%LOG%"
echo [%DATE% %TIME%] AJUSTE DE METRICAS>>"%LOG%"
echo =====================================================>>"%LOG%"

for /f "tokens=2 delims==" %%A in (
'findstr /i "InterfacePrincipal=" "%CONFIG%"'
) do set INTERFACE=%%A

for /f "tokens=2 delims==" %%A in (
'findstr /i "MetricaPrincipal=" "%CONFIG%"'
) do set METRICA=%%A

echo Interface Principal:
echo !INTERFACE!

echo Metricas:
echo !METRICA!

netsh interface ipv4 set interface ^
"!INTERFACE!" ^
metric=!METRICA! ^
>> "%LOG%" 2>&1

if !errorlevel! equ 0 (
    echo OK.
    echo [%DATE% %TIME%] Interface ajustada >> "%LOG%"
) else (
    echo ERRO AO AJUSTAR INTERFACE.
    echo [%DATE% %TIME%] Falha de ajuste >> "%LOG%"
)

echo Interfaces detectadas:
echo.

netsh interface ipv4 show interface

echo.

pause

exit /b