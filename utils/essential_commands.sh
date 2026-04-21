#!/usr/bin/env bash
# ------------------------------------------------------------------------ #
# Script Name:   essential_commands.sh
# Description:   Demonstração de comandos essenciais DevOps (Atividade 1.1)
# Site:          https://github.com/Gabrielsnr-byte/Praticas-DevOps-2026
# Written by:    Gabriel Nascimento
# Maintenance:   Gabriel Nascimento
# ------------------------------------------------------------------------ #
# Repository:    
#       Path: Praticas-DevOps-2026/utils/essential_commands.sh
# ------------------------------------------------------------------------ #

# Variáveis de Cores (ANSI) ---------------------------------------------- #
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m' # Sem cor
readonly TEMP_FILE="demo_devops.txt"

# Funções de Formatação --------------------------------------------------- #

print_section() {
    echo -e "\n${BLUE}============================================================${NC}"
    echo -e "${BLUE}  $1 ${NC}"
    echo -e "${BLUE}============================================================${NC}"
}

print_command() {
    echo -e "${YELLOW}>> Executando: $1${NC}"
}

# Início do Script -------------------------------------------------------- #

clear
print_section "TECHSOLUTIONS - ESSENTIAL DEVOPS COMMANDS"
echo "Iniciando demonstração prática dos fundamentos Linux..."

# 1. pwd
print_section "1. pwd - Print Working Directory"
print_command "pwd"
echo "   Descrição: Exibe o caminho absoluto do diretório atual."
echo "   Help: pwd --help"
echo "   Resultado: $(pwd)"

# 2. date
print_section "2. date - Display date and time"
print_command "date '+%d/%m/%Y %H:%M:%S'"
echo "   Descrição: Mostra a data e hora atual do sistema."
echo "   Help: date --help"
echo "   Resultado: $(date '+%d/%m/%Y %H:%M:%S')"

# 3. touch
print_section "3. touch - Create Empty File"
print_command "touch $TEMP_FILE"
touch $TEMP_FILE
echo "   Descrição: Cria um arquivo vazio ou atualiza o timestamp de um existente."
echo "   Help: touch --help"
echo "   Resultado: Arquivo '$TEMP_FILE' criado no diretório atual."

# 4. cat
print_section "4. cat - Concatenate and Display"
echo "DevOps: Automatizar, Monitorar e Colaborar." > $TEMP_FILE
print_command "cat $TEMP_FILE"
echo "   Descrição: Exibe o conteúdo de um arquivo no terminal."
echo "   Help: cat --help"
echo "   Conteúdo do arquivo:"
cat $TEMP_FILE

# 5. grep
print_section "5. grep - Pattern Search"
print_command "grep 'DevOps' $TEMP_FILE"
echo "   Descrição: Busca por termos ou padrões específicos dentro de textos."
echo "   Help: grep --help"
echo "   Resultado:"
grep --color=always "DevOps" $TEMP_FILE

# 6. curl
print_section "6. curl - Client URL"
print_command "curl -I https://www.google.com"
echo "   Descrição: Transfere dados de/para servidores. Usado para testar APIs e sites."
echo "   Help: curl --help"
echo "   Status da Resposta (Cabeçalho):"
curl -s -I https://www.google.com | head -n 1

# 7. gzip
print_section "7. gzip - Compression"
print_command "gzip $TEMP_FILE"
gzip -f $TEMP_FILE
echo "   Descrição: Comprime arquivos para economizar espaço (formato .gz)."
echo "   Help: gzip --help"
echo "   Resultado: Gerado arquivo $(ls $TEMP_FILE.gz)"

# 8. chmod
print_section "8. chmod - Change Mode"
print_command "chmod 644 $TEMP_FILE.gz"
chmod 644 $TEMP_FILE.gz
echo "   Descrição: Altera permissões de leitura, escrita e execução."
echo "   Help: chmod --help"
echo "   Permissões atuais:"
ls -l $TEMP_FILE.gz

# 9. pgrep
print_section "9. pgrep - Process Grep"
print_command "pgrep bash"
echo "   Descrição: Localiza o ID (PID) de processos pelo nome."
echo "   Help: pgrep --help"
echo "   ID do processo Bash atual: $(pgrep -u $USER bash | xargs)"

# 10. ps
print_section "10. ps - Process Status"
print_command "ps aux | head -n 5"
echo "   Descrição: Lista os processos ativos no sistema."
echo "   Help: ps --help"
ps aux | head -n 5

# 11. df
print_section "11. df - Disk Free"
print_command "df -h ."
echo "   Descrição: Exibe o uso de espaço em disco do sistema de arquivos."
echo "   Help: df --help"
df -h .

# 12. du
print_section "12. du - Disk Usage"
print_command "du -sh ."
echo "   Descrição: Estima o espaço ocupado por arquivos e pastas."
echo "   Help: du --help"
echo "   Uso total desta pasta: $(du -sh .)"

# Cleanup ----------------------------------------------------------------- #
print_section "FINALIZAÇÃO"
echo "Limpando arquivos temporários..."
rm -f $TEMP_FILE.gz
echo -e "${GREEN}Script executado com sucesso! Pronto para o commit.${NC}"

# ------------------------------------------------------------------------ #
# END #
