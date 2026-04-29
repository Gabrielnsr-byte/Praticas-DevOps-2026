#!/bin/bash

# Função para exibir o menu
exibir_menu() {
    echo "============================================="
    echo "     Manipulador Multifuncional de Arquivos  "
    echo "============================================="
    echo "1) Renomear arquivos em lote (add prefixo)"
    echo "2) Converter extensões (ex: .txt para .md)"
    echo "3) Compactar diretório (.tar.gz)"
    echo "4) Descompactar arquivo (.tar.gz)"
    echo "5) Alterar permissões em lote"
    echo "6) Sair"
    echo "============================================="
}

while true; do
    exibir_menu
    read -p "Escolha uma opção [1-6]: " opcao

    case $opcao in
        1)
            read -p "Digite o diretório dos arquivos: " dir
            read -p "Digite o prefixo a ser adicionado: " prefix
            if [ -d "$dir" ]; then
                for file in "$dir"/*; do
                    if [ -f "$file" ]; then
                        mv "$file" "$dir/${prefix}_$(basename "$file")"
                    fi
                done
                echo "Arquivos renomeados com sucesso!"
            else
                echo "Diretório inválido."
            fi
            ;;
        2)
            read -p "Digite o diretório: " dir
            read -p "Extensão atual (ex: txt): " ext_in
            read -p "Nova extensão (ex: md): " ext_out
            if [ -d "$dir" ]; then
                for file in "$dir"/*."$ext_in"; do
                    if [ -f "$file" ]; then
                        mv "$file" "${file%.$ext_in}.$ext_out"
                    fi
                done
                echo "Arquivos convertidos com sucesso!"
            else
                echo "Diretório inválido."
            fi
            ;;
        3)
            read -p "Digite o diretório a ser compactado: " dir
            read -p "Nome do arquivo de saída (sem a extensão): " name
            if [ -d "$dir" ]; then
                tar -czf "${name}.tar.gz" -C "$(dirname "$dir")" "$(basename "$dir")"
                echo "Compactação concluída: ${name}.tar.gz"
            else
                echo "Diretório inválido."
            fi
            ;;
        4)
            read -p "Digite o caminho do arquivo .tar.gz: " file
            read -p "Diretório de destino: " dest
            if [ -f "$file" ]; then
                mkdir -p "$dest"
                tar -xzf "$file" -C "$dest"
                echo "Descompactação concluída em $dest"
            else
                echo "Arquivo inválido."
            fi
            ;;
        5)
            read -p "Digite o diretório: " dir
            read -p "Digite as permissões (ex: 644 ou 755): " perm
            if [ -d "$dir" ]; then
                chmod -R "$perm" "$dir"
                echo "Permissões alteradas com sucesso!"
            else
                echo "Diretório inválido."
            fi
            ;;
        6)
            echo "Encerrando..."
            exit 0
            ;;
        *)
            echo "Opção inválida!"
            ;;
    esac
    echo ""
done
