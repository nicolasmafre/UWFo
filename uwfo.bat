@echo off
:: uwfo.bat - Unified Write Filter Overseer (Core)
color CF
title Gerenciador e Manutencao do UWF - Etec

setlocal EnableDelayedExpansion

:: Define diretório base absoluto e entra nele
set "BASE_DIR=%~dp0"
cd /d "%BASE_DIR%"

:: --- ROTINA DE AUTO-ELEVAÇÃO BLINDADA ---
:VerificarAdmin
net session >nul 2>&1
if %errorLevel% equ 0 (
    :: O script já possui privilégios de Admin. Prossegue silenciosamente.
    call "rede\metrica.bat" 2>nul
    goto :MenuPrincipal
) else (
    :: Trava Anti-Loop: Se já tentamos elevar (parâmetro "Elevating") e falhou, aborta.
    if "%~1"=="Elevating" (
        echo.
        echo ==================================================================
        echo [ERRO CRITICO] O script falhou ao obter direitos de Administrador.
        echo Verifique as politicas do UAC ou execute clicando com o botao 
        echo direito e escolhendo "Executar como Administrador".
        echo ==================================================================
        pause
        exit /b
    )
    
    echo Solicitando privilegios de Administrador...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -ArgumentList 'Elevating' -Verb RunAs"
    exit /b
)

:MenuPrincipal
color CF
cls
echo.                    UWFo 0.1.0 (Modular)
echo ============================================================
echo        Supervisor do Filtro de Escrita Unificado
echo ============================================================
echo.
echo [1] Verificar Compatibilidade e Status do Sistema
echo [2] Menu de Protecao (Ativar Filtro para as Aulas)
echo [3] Menu de Manutencao (Desativar Filtro e Atualizar)
echo [4] Menu de Ajustes Avancados (Sobreposicao/Overlay)
echo [5] Sincronizar Exclusoes (Aplicar configs\*.txt)
echo [6] Diagnostico de Rede e LanSchool
echo [7] Executar Limpeza (Logs e Caches)
echo [8] Reiniciar Computador
echo ------------------------------------------------------------
echo [0] Sair
echo [?] Ajuda
echo ============================================================
echo.

:: Tratamento seguro de input (evita falhas se o usuário der apenas "Enter")
set "opcao="
set /p opcao="Escolha uma opcao: "
if not defined opcao goto :MenuPrincipal
set "opcao=%opcao:"=%"
if "%opcao%"=="" goto :MenuPrincipal

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