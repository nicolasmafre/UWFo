# UWFo - Unified Write Filter Overseer

```text
 _   _  __        __  _____       
| | | | \ \      / / |  ___|___  
| | | |  \ \ /\ / /  | |_  / _ \ 
| |_| |   \ V  V /   |  _|| (_) |
 \___/     \_/\_/    |_|   \___/  v 1.0.0
=========================================
Supervisor do Filtro de Escrita Unificado
=========================================
```

## 📖 Visão Geral
O UWFo é uma solução modular e de código aberto para gerir o Unified Write Filter (UWF) em ambientes educacionais e corporativos. Desenvolvido especificamente para os laboratórios de TI (como os das Etecs), ele orquestra o congelamento de discos, gere exclusões críticas (LanSchool, Veyon, SolidWorks, Android Studio, etc.) e garante a auditoria das ações através de logs locais.

## ✨ Principais Funcionalidades
Arquitetura Modular: Separação clara entre Core, Configurações, UWF, Manutenção e Rede.

Auto-Elevação Blindada: O script solicita privilégios de Administrador automaticamente sem entrar em loops.

Configuração Centralizada: Nada de editar código Batch. Tamanhos de Overlay e Exclusões são geridos através de ficheiros .ini e .txt limpos.

Diagnóstico de Rede Avançado: Módulo dedicado que vasculha placas físicas e diagnostica ativamente o status e exclusões do LanSchool.

Auditoria Contínua: Todas as ações (ativação, limpeza, falhas) são registadas com data e hora na pasta logs/.

## 📂 Arquitetura do Projeto

```
UWFo\
│   uwfo.bat                  # Script Principal (Orquestrador)
│   LICENSE                   # Licença MIT
│   README.md                 # Documentação
│
├── configs\                  # Variáveis e Exclusões do Sistema
│   ├── config.ini            # Tamanho e tipo do Overlay
│   ├── exclusoes_arquivos.txt
│   └── exclusoes_registro.txt
│
├── core\                     # Módulos de base
│   ├── ajuda.bat
│   ├── logger.bat            # Sistema de log rotacional
│   └── status.bat            # Verificação de ambiente
│
├── logs\                     # Registo de auditoria (Gerados automaticamente)
│   ├── ativacao.log
│   ├── lanschool.log
│   └── ...
│
├── manutencao\               # Tarefas do sistema operacional
│   ├── limpeza.bat
│   └── updates.bat
│
├── rede\                     # Diagnósticos e interfaces
│   ├── lanschool.bat
│   └── metrica.bat
│
└── uwf\                      # Interações diretas com o uwfmgr
    ├── ativar.bat
    ├── desativar.bat
    ├── exclusoes.bat
    └── overlay.bat
```

## ⚙️ Como Instalar e Configurar

1. Clone este repositório ou extraia a pasta completa no diretório raiz da máquina (ex: ```C:\UWFo```).

2. Vá à pasta ```configs/``` e edite os ficheiros:

    - ```config.ini```: Defina o tamanho do seu Overlay em Megabytes.

    - ```exclusoes_arquivos.txt```: Adicione os caminhos das pastas que não devem ser congeladas (uma por linha). O script entende variáveis como %USERPROFILE%.

3. Dê um duplo clique no ```uwfo.bat```. Ele pedirá elevação para Administrador e abrirá o menu principal.

## 🚀 Como Usar no Dia a Dia
- **Para as Aulas (Congelar)**: Utilize a _Opção 2_. O script fará uma limpeza profunda, bloqueará o Windows Update, sincronizará as suas configurações da pasta ```configs/``` e deixará a máquina pronta para ser reiniciada em modo protegido.

- **Para Manutenção (Descongelar)**: Utilize a _Opção 3_. O disco será descongelado e os serviços do Windows Update voltarão a funcionar. Reinicie a máquina, instale os softwares necessários e volte a ativar o filtro usando a _Opção 2_.

- **Diagnóstico**: A _Opção 6_ é extremamente útil se houver problemas na comunicação do software de gestão de sala (LanSchool), testando processos, exclusões de registro e métricas de rede.

## 📝 Licença
Este projeto está licenciado ao abrigo da **Licença MIT** - veja o ficheiro [LICENSE](LICENSE) para detalhes. Pode utilizá-lo livremente, modificá-lo e adaptá-lo às necessidades da sua instituição.

Desenvolvido com foco na eficiência de laboratórios educacionais por Nícolas Martins Freitas.