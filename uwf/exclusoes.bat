@echo off
setlocal EnableDelayedExpansion
if not "%~1"=="SYNC" exit /b

echo Sincronizando Exclusoes de Arquivos e Pastas...
for /f "usebackq eol=# tokens=*" %%A in ("%BASE_DIR%configs\exclusoes_arquivos.txt") do (
    call set "EXPANDED_PATH=%%A"
    
    :: Garante que a pasta existe antes de excluir
    if not exist "!EXPANDED_PATH!" (
        mkdir "!EXPANDED_PATH!" 2>nul
    )
    uwfmgr file add-exclusion "!EXPANDED_PATH!" >nul 2>&1
)

echo Sincronizando Exclusoes de Registro...
for /f "usebackq eol=# tokens=*" %%B in ("%BASE_DIR%configs\exclusoes_registro.txt") do (
    uwfmgr registry add-exclusion "%%B" >nul 2>&1
)

call "%BASE_DIR%core\logger.bat" "INFO" "Exclusoes sincronizadas a partir dos arquivos TXT" "ativacao.log"