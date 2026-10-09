@echo off
:: uwfo.bat - Unified Write Filter Overseer (Core)
color CF
title Gerenciador e Manutenção do UWF - Etec
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: Define diretório base
set "BASE_DIR=%~dp0"
cd /d "%BASE_DIR%"

:: Verifica Admin e configura métrica de rede dinamicamente
call "core\admin.bat"
if %errorLevel% neq 0 exit /b

:MenuPrincipal
color CF
cls
echo.                    UWFo 2.0.0 (Modular)
echo ============================================================
echo        Supervisor do Filtro de Escrita Unificado
echo ============================================================
echo.
echo [1] Verificar Compatibilidade e Status do Sistema
echo [2] Menu de Proteção (Ativar Filtro para as Aulas)
echo [3] Menu de Manutenção (Desativar Filtro e Atualizar)
echo [4] Menu de Ajustes Avançados (Sobreposição/Overlay)
echo [5] Sincronizar Exclusões (Aplicar configs\*.txt)
echo [6] Diagnóstico de Rede e LanSchool
echo [7] Executar Limpeza (Logs e Caches)
echo [8] Reiniciar Computador
echo ------------------------------------------------------------
echo [0] Sair
echo [?] Ajuda
echo ============================================================
set "opcao="
set /p opcao="Escolha uma opção: "

if "%opcao%"=="1" call "core\status.bat"
if "%opcao%"=="2" call "uwf\ativar.bat"
if "%opcao%"=="3" call "uwf\desativar.bat"
if "%opcao%"=="4" call "uwf\overlay.bat"
if "%opcao%"=="5" call "uwf\exclusoes.bat" "SYNC"
if "%opcao%"=="6" call "rede\lanschool.bat"
if "%opcao%"=="7" call "manutencao\limpeza.bat" "MANUAL"
if "%opcao%"=="8" goto :Reiniciar
if "%opcao%"=="0" exit /b
if "%opcao%"=="?" call "core\ajuda.bat"

goto :MenuPrincipal

:Reiniciar
call "core\logger.bat" "INFO" "Requisicao de reinicio enviada pelo usuario." "uwfo.log"
shutdown /r /t 3
exit /b