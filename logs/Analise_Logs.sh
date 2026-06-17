#!/bin/bash 

# Define o arquivo de log de entrada
LOG_FILE="apache.log"

# Verifica se o arquivo de log existe
if [ ! -f "$LOG_FILE" ]; then
    echo "Erro: Arquivo $LOG_FILE não encontrado."
    exit 1
fi

# Cria o diretório com a estrutura exigida
DIR_NAME="log_analysis_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$DIR_NAME"

echo "Analisando logs..."

# 1. Lista de IPs únicos que acessaram o servidor
awk '{print $1}' "$LOG_FILE" | sort -u > "$DIR_NAME/1_unique_ips.txt"

# 2. Métodos HTTP e quantidade de cada um
awk -F'"' '{print $2}' "$LOG_FILE" | awk '{print $1}' | sort | uniq -c | sort -nr > "$DIR_NAME/2_http_methods.txt"

# 3. Requisições com métodos DELETE e PUT
grep -E '"(DELETE|PUT) ' "$LOG_FILE" > "$DIR_NAME/3_dangerous_methods.txt"

# 4. URLs requisitadas e contagem de acessos
awk -F'"' '{print $2}' "$LOG_FILE" | awk '{print $2}' | sort | uniq -c | sort -nr > "$DIR_NAME/4_urls.txt"

# 5. IPs que mais fizeram requisições (top 10)
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 10 > "$DIR_NAME/5_top_ips.txt"

# 6. Relatório consolidado
{
    echo "================ RELATÓRIO CONSOLIDADO ================"
    echo "Gerado em: $(date)"
    echo "Total de linhas processadas: $(wc -l < "$LOG_FILE")"
    echo -e "\n--- Top 5 IPs com mais requisições ---"
    head -n 5 "$DIR_NAME/5_top_ips.txt"
    echo -e "\n--- Resumo de Métodos HTTP ---"
    cat "$DIR_NAME/2_http_methods.txt"
    echo -e "\n--- Tentativas de Métodos Suspeitos (DELETE/PUT) ---"
    wc -l < "$DIR_NAME/3_dangerous_methods.txt" | awk '{print $1 " requisições suspeitas encontradas."}'
    echo "======================================================="
} > "$DIR_NAME/report.txt"

echo "Análise concluída! Arquivos gerados no diretório: $DIR_NAME/"
