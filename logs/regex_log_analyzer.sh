#!/bin/bash

# Define o nome do diretório com timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_DIR="log_analysis_$TIMESTAMP"
mkdir -p "$OUTPUT_DIR"

LOG_FILE="apache.log"

# Verifica se o arquivo de log existe
if [ ! -f "$LOG_FILE" ]; then
    echo "Erro: Arquivo $LOG_FILE não encontrado!"
    exit 1
fi

echo "Iniciando análise de logs..."

# 1. IPs únicos
awk '{print $1}' "$LOG_FILE" | sort -u > "$OUTPUT_DIR/1_unique_ips.txt"

# 2. Métodos HTTP e quantidade
awk -F'"' '{print $2}' "$LOG_FILE" | awk '{print $1}' | sort | uniq -c | sort -nr > "$OUTPUT_DIR/2_http_methods.txt"

# 3. Métodos perigosos (DELETE e PUT)
grep -E "\"DELETE |\"PUT " "$LOG_FILE" > "$OUTPUT_DIR/3_dangerous_methods.txt"

# 4. URLs requisitadas e contagem
awk -F'"' '{print $2}' "$LOG_FILE" | awk '{print $2}' | sort | uniq -c | sort -nr > "$OUTPUT_DIR/4_urls.txt"

# 5. Top 10 IPs
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 10 > "$OUTPUT_DIR/5_top_ips.txt"

# 6. Relatório consolidado (report.txt)
{
    echo "--- RELATÓRIO DE ANÁLISE DE LOGS ---"
    echo "Data da análise: $(date)"
    echo "Total de IPs únicos: $(wc -l < "$OUTPUT_DIR/1_unique_ips.txt")"
    echo ""
    echo "Métodos HTTP detectados:"
    cat "$OUTPUT_DIR/2_http_methods.txt"
    echo ""
    echo "Alertas: Métodos perigosos detectados (DELETE/PUT): $(wc -l < "$OUTPUT_DIR/3_dangerous_methods.txt")"
    echo ""
    echo "Top 10 IPs com mais requisições:"
    cat "$OUTPUT_DIR/5_top_ips.txt"
} > "$OUTPUT_DIR/report.txt"

echo "Análise concluída. Resultados em: $OUTPUT_DIR/"
