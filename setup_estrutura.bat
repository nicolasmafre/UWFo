@echo off
mkdir core manutencao rede uwf configs logs 2>nul
type nul > logs\uwfo.log
type nul > logs\erros.log
type nul > logs\rede.log
type nul > logs\lanschool.log
type nul > logs\ativacao.log
type nul > logs\manutencao.log
echo Pastas e arquivos de log criados com sucesso!
pause