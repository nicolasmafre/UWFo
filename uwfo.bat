@echo off
setlocal EnableExtensions

color CF
title UWFo
chcp 65001 >nul

call "%~dp0core\logger.bat
call "%~dp0core\admin.bat"

REM ==========================
REM CRIA PASTA DE LOG DO DIA
REM ==========================

for /f %%A in (
'PowerShell -Command "Get-Date -Format yyyyMMdd"'
) do set DATA=%%A

if not exist "%~dp0logs\%DATA%" (
    mkdir "%~dp0logs\%DATA%"
)

REM ==========================

:MENU

cls

echo ===================================
echo            UWFo 1.0
echo ===================================
echo.
echo [1] Status
echo [2] Ativar UWF
echo [3] Desativar UWF
echo [4] Overlay
echo [5] Exclusoes
echo [6] Limpeza
echo [7] LanSchool
echo [8] Ajuda
echo [0] Sair
echo.

set /p op=Escolha:

if "%op%"=="1" call "%~dp0core\status.bat"
if "%op%"=="2" call "%~dp0uwf\ativar.bat"
if "%op%"=="3" call "%~dp0uwf\desativar.bat"
if "%op%"=="4" call "%~dp0uwf\overlay.bat"
if "%op%"=="5" call "%~dp0uwf\exclusoes.bat"
if "%op%"=="6" call "%~dp0manutencao\limpeza.bat"
if "%op%"=="7" call "%~dp0rede\lanschool.bat"
if "%op%"=="8" call "%~dp0core\ajuda.bat"

if "%op%"=="0" exit

goto MENU