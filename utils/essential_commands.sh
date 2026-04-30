#!/usr/bin/env bash
# ---------------------------------------------------------------------------- #
# Script Name: essential_commands.sh
# Description: Demonstrates essential DevOps commands
# Site: https://github.com/Mateusjesper/Praticas-DevOps-2026.git
# Written by: Mateus Pereira
# Maintenance: Mateus Pereira
# ---------------------------------------------------------------------------- #
# Usage:
#     $ ./essential_commands.sh
# ---------------------------------------------------------------------------- #
# Repository:
#     Path: utils/essential_commands.sh
# ---------------------------------------------------------------------------- #
# History:
#     v1.0 21/04/2026 - Mateus Pereira:
#     - Initial version
# ---------------------------------------------------------------------------- #

# Variables ------------------------------------------------------------------- #
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m'

# Functions ------------------------------------------------------------------- #
print_section() {
    echo -e "\n${BLUE}==== $1 ====${NC}"
}

print_command() {
    echo -e "${GREEN}>> $1${NC}"
    eval "$1"
}

# Main Code ------------------------------------------------------------------------ #
clear
print_section "ESSENTIAL DEVOPS COMMANDS DEMO"
echo " "

# 1. pwd
print_section "1. pwd - Diretório atual"
print_command "pwd"
echo "Descrição: Mostra diretório atual"
echo "Exemplo real: localização do script"

# 2. date
print_section "2. date - Data e hora (Exemplo boas-vindas)"
print_command "date"
echo "Usado no script de boas-vindas"

# 3. grep (Atividade Logs)
print_section "3. grep - Buscar IP (Exemplo syslog)"
echo "Simulação de log:"
echo "192.168.0.1 acesso" > log.txt
print_command "grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' log.txt"
echo "Descrição: Extrai IPs do log"

# 4. cat (Atividade Logs)
print_section "4. cat - Relatório final"
print_command "cat log.txt"

# 5. find (Atividade 04)
print_section "5. find - Buscar arquivos .log"
print_command "find /var/log -type f -name '*.log' | head -3"

# 6. head (Atividade 04)
print_section "6. head - Primeiros registros"
echo "Simulação apache.log"
echo "registro1" > apache.log
echo "registro2" >> apache.log
print_command "head -5 apache.log"

# 7. df (Atividade 04)
print_section "7. df - Espaço em disco"
print_command "df -h"

# 8. du (Atividade 04)
print_section "8. du - Tamanho diretório"
print_command "du -sh ."

# 9. whoami (Atividade 04)
print_section "9. whoami - Usuário atual"
print_command "whoami"

# 10. id (Atividade 04)
print_section "10. id - UID e grupos"
print_command "id"

# 11. mkdir (Atividade 04)
print_section "11. mkdir - Criar diretório"
print_command "mkdir teste_dir"

# 12. rmdir (Atividade 04)
print_section "12. rmdir - Remover diretório"
print_command "rmdir teste_dir"

# 13. touch (Atividade 1.1)
print_section "13. touch - Criar arquivo"
print_command "touch exemplo.txt"

# 14. gzip (Atividade 1.1)
print_section "14. gzip - Compactar"
print_command "gzip -k exemplo.txt"

# 15. chmod (Atividade 1.1)
print_section "15. chmod - Permissão"
print_command "chmod 755 exemplo.txt"

# 16. curl (Atividade 1.1)
print_section "16. curl - Requisição web"
print_command "curl -s https://example.com | head -3"

# 17. ps (Atividade 1.1)
print_section "17. ps - Processos"
print_command "ps aux | head -5"

# 18. pgrep (Atividade 1.1)
print_section "18. pgrep - Buscar processo"
print_command "pgrep bash"

# Cleanup
rm -f exemplo.txt exemplo.txt.gz log.txt apache.log

echo -e "\n${YELLOW}Demonstração completa finalizada!${NC}"

# END ------------------------------------------------------------------------- #
