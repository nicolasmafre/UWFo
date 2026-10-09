# UWFo - Unified Write Filter Overseer

```text
  _   ___      ____  ___       
 | | | \ \    / /  \/  |       
 | | | |\ \  / /| \  / | ___   
 | |_| | \ \/ / | |\/| |/ _ \  
  \___/   \__/  |_|  |_|\___/  
==================================
 Gerenciador Escolar de Laboratórios
==================================
```

## Visão Geral
O **UWFo** é uma solução modular para gerenciar o _Unified Write Filter_ (UWF) no **Windows 10/11 Education e Enterprise**. Projetado especificamente para as necessidades de laboratórios de TI (Etec), ele orquestra o congelamento de disco, exclusões vitais (_LanSchool_, _Veyon_, _SolidWorks_, _Android Studio_) e garante a auditoria das ações via logs locais.

## Arquitetura Modular
Em vez de um script .bat gigante, o **UWFo** agora separa Lógica de Execução e Dados de Configuração.

`uwfo.bat`: Menu principal e orquestrador.

`configs\`: Contém .txt de exclusões e config.ini. Sempre edite as exclusões aqui.

`logs\`: Registros auditáveis de quem ativou/desativou o filtro e erros do sistema.

`rede\`, `manutencao\`, `uwf\`: Módulos independentes executados sob demanda.

## Como Usar
Extraia a pasta completa **UWFo** no diretório raiz (```C:\UWFo``` - recomendado).

Para adicionar uma nova pasta que não deve ser congelada, edite `configs\exclusoes_arquivos.txt`.

Clique duas vezes em uwfo.bat (ele pedirá permissão de Administrador automaticamente).

Utilize a Opção 2 para ativar a proteção e a Opção 3 para dias de manutenção/instalação de software.

## Destaques da Versão 2.0
**Rede Dinâmica:** A métrica de rede não foca mais apenas na interface chamada "_Ethernet_". O script vasculha via _PowerShell_ por qualquer interface física ativa, prevenindo quebras em máquinas com múltiplas placas de rede ou nomes alterados.

**Diagnóstico LanSchool:** Módulo de rede específico que verifica se o processo student.exe está rodando e se suas chaves de registro estão devidamente salvas do UWF.

**Segurança e Log:** Cada ação administrativa é registrada na pasta logs\.


```
Por que esta arquitetura é profissional?


1. Centralização de Dados (`configs/`): Quando o governo/Estado adicionar um novo software, você não precisa ler linhas de código `Batch`. Você abre o arquivo de texto `exclusoes_arquivos.txt`, coloca o caminho e salva. 

2. Log Rotacional e Auditoria (`logger.bat`): Permite saber quando o filtro falhou ou quando a máquina entrou em modo de manutenção.

3. Escalabilidade: Se precisar adicionar um módulo para limpar chaves de licença expiradas, basta criar um script na pasta `manutencao` e chamá-lo no menu.
```