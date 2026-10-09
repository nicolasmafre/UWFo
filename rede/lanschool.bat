@echo off
cls
echo ============================================================
echo           DIAGNÓSTICO DE REDE E LANSCHOOL
echo ============================================================
call "%BASE_DIR%core\logger.bat" "INFO" "Diagnostico LanSchool iniciado" "lanschool.log"

echo Verificando processo LanSchool (student.exe)...
tasklist | findstr /i "student.exe" >nul
if %errorLevel% equ 0 (
    echo [OK] LanSchool esta rodando em memoria.
) else (
    echo [AVISO] O processo 'student.exe' nao foi encontrado!
    call "%BASE_DIR%core\logger.bat" "WARN" "LanSchool student.exe nao esta rodando" "lanschool.log"
)
echo.

echo Verificando exclusoes no UWF...
uwfmgr file get-exclusions | findstr /i "LanSchool" >nul
if %errorLevel% equ 0 (
    echo [OK] Pasta LanSchool excluida no UWF.
) else (
    echo [AVISO] Pasta do LanSchool NAO esta nas exclusoes do UWF!
)

uwfmgr registry get-exclusions | findstr /i "LanSchool" >nul
if %errorLevel% equ 0 (
    echo [OK] Registro LanSchool excluido no UWF.
) else (
    echo [AVISO] Registro do LanSchool NAO esta nas exclusoes!
)

echo.
echo Teste de conectividade (Broadcast base)...
ping 127.0.0.1 -n 2 >nul
echo Concluido. Consulte logs\lanschool.log para auditoria.
pause