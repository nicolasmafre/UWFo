@echo off

for /f %%A in (
'PowerShell -Command "Get-Date -Format yyyyMMdd"'
) do set DATA=%%A

set LOG=%~dp0..\logs\%DATA%\exclusoes.log

echo Aplicando exclusoes...

for /f "usebackq delims=" %%A in (
"%~dp0..\configs\exclusoes_arquivos.txt"
) do (

    echo Arquivo:
    echo %%A

    uwfmgr file add-exclusion "%%A"

)

for /f "usebackq delims=" %%A in (
"%~dp0..\configs\exclusoes_registro.txt"
) do (

    echo Registro:
    echo %%A

    uwfmgr registry add-exclusion "%%A"

)

pause

exit /b