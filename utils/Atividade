#!/usr/bin/env bash
# ------------------------------------------------------------------------ #
# Script Name:   automacao_geral.sh
# Description:   Toolbox completa integrada (Atividades 1.1 a Regex)
# Written by:    Gabriel Nascimento Santos Reis
# ------------------------------------------------------------------------ #

# CORES E VARIÁVEIS ------------------------------------------------------ #
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m'

# FUNÇÕES ---------------------------------------------------------------- #

menu_cabecalho() {
    echo -e "${BLUE}============================================================${NC}"
    echo -e "${BLUE}  $1 ${NC}"
    echo -e "${BLUE}============================================================${NC}"
}

# [Att 1.1] Comandos Essenciais 
executar_essenciais() {
    menu_cabecalho "EXPLORAÇÃO DE COMANDOS DEVOPS"
    echo "Diretório atual: $(pwd)" [cite: 13]
    echo "Data/Hora: $(date)" [cite: 19]
    echo "Espaço em disco:" ; df -h / | grep '/' [cite: 75]
    echo "Uso da pasta atual: $(du -sh .)" [cite: 81]
}

# [Sintaxe] Inputs e Cálculos Básicos 
executar_sintaxe() {
    menu_cabecalho "SINTAXE E DADOS DO USUÁRIO"
    read -p "Nome: " nome ; read -p "Ano de Nascimento: " ano [cite: 101-102]
    idade=$(( $(date +%Y) - ano )) [cite: 104]
    echo "Olá $nome, sua idade aproximada é $idade anos." [cite: 105-106]
}

# [Ativ. Sala] Lógica e Comparação 
executar_logica() {
    menu_cabecalho "LÓGICA E COMPARAÇÕES"
    read -p "Digite o número 1: " n1 ; read -p "Digite o número 2: " n2 [cite: 142-143]
    if [ "$n1" -gt "$n2" ]; then echo "$n1 é maior." [cite: 145]
    elif [ "$n1" -lt "$n2" ]; then echo "$n2 é maior." [cite: 147]
    else echo "São iguais."[cite: 148]; fi
}

# [Ativ. 04] Logs e Sistema 
executar_sistema() {
    menu_cabecalho "MANUTENÇÃO E LOGS"
    echo "Usuário atual: $(whoami)" [cite: 268]
    echo "Atualizando sistema..." ; sudo apt update && sudo apt clean
}

# [Regex] Validações 
executar_validador() {
    menu_cabecalho "VALIDAÇÃO REGEX"
    read -p "Informe o e-mail: " email
    [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]] && echo "Válido" || echo "Inválido" [cite: 314-315]
}

# MENU PRINCIPAL --------------------------------------------------------- #
while true; do
    clear
    menu_cabecalho "PAINEL DEVOPS - GABRIEL NASCIMENTO"
    echo "1) Comandos Essenciais (Att 1.1)"
    echo "2) Sintaxe e Idade"
    echo "3) Lógica de Números"
    echo "4) Atualização e Logs"
    echo "5) Validador Regex"
    echo "6) Sair"
    read -p "Escolha: " op
    case $op in
        1) executar_essenciais ;; 2) executar_sintaxe ;; 
        3) executar_logica ;; 4) executar_sistema ;;
        5) executar_validador ;; 6) exit 0 ;;
    esac
    read -p "Pressione Enter..."
done
