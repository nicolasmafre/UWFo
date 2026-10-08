@echo off

cls

for /f "tokens=2 delims==" %%A in (
'findstr /i "Nome=" "%~dp0..\configs\config.ini"'
) do set APP=%%A

for /f "tokens=2 delims==" %%A in (
'findstr /i "Versao=" "%~dp0..\configs\config.ini"'
) do set VERSAO=%%A

echo ============================================================
echo %APP% %VERSAO%
echo ============================================================
echo Supervisor do Filtro de Escrita Unificado
echo ============================================================
echo.

echo O QUE E O UWF?
echo ------------------------------------------------------------
echo O Unified Write Filter protege o sistema operacional.
echo.
echo Todas as alteracoes feitas pelos alunos sao gravadas
echo temporariamente em uma area chamada Overlay.
echo.
echo Ao reiniciar o computador estas alteracoes sao descartadas.
echo.

echo CICLO DE MANUTENCAO
echo ------------------------------------------------------------
echo 1 - Desativar UWF
echo 2 - Reiniciar
echo 3 - Atualizar Windows
echo 4 - Atualizar Programas
echo 5 - Ativar UWF
echo 6 - Reiniciar novamente
echo.

echo MENU PRINCIPAL
echo ------------------------------------------------------------
echo [1] Status
echo [2] Ativar UWF
echo [3] Desativar UWF
echo [4] Overlay
echo [5] Exclusoes
echo [6] Limpeza
echo [7] LanSchool
echo [0] Sair
echo.

echo OBSERVACOES
echo ------------------------------------------------------------
echo * O UWF exige reinicializacao.
echo * O Overlay consome espaco temporario.
echo * Mantenha o LanSchool excluido do filtro.
echo * VirtualBox pode interferir na descoberta dos alunos.
echo.

pause

exit /b