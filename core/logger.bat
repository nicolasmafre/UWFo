@echo off
:: Uso: call core\logger.bat "TIPO" "Mensagem" "arquivo.log"
:: Ex: call core\logger.bat "INFO" "Filtro ativado" "ativacao.log"
set "TIPO=%~1"
set "MSG=%~2"
set "ARQUIVO=%~3"

:: Obtém data e hora formatadas seguras
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set "DATA=%%a/%%b/%%c"
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set "HORA=%%a:%%b"

echo [%DATA% %HORA%] [%TIPO%] %MSG% >> "%BASE_DIR%logs\%ARQUIVO%"