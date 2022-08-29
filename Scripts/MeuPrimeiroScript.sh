#!/usr/bin/zsh

##############################################
#
# MeuPrimeiroScript.sh - Script de exemplo do curso
#
# Autor: Gabriel Pinho
# Data Criação: 10/08/2022
#
# Descricao: Script de exemplo que le data e hora atual e exibe a lista de alunos
#
# Exemplo de uso: ./MeuPrimeroScript.sh
#
# Alteracoes
# 	Dia X - Inclusao da funcao de ordenacao
# 	Dia Y - Correcao da funcao de leitura
#
###############################################

DATAHORA=$(date +%H:%M)
ARQALUNOS="/home/biel/Codes/Udemy/ShellScript_Ricardo_Prudenciato/arquivos/alunos2.txt"


# Funcao de leitura de data e hora
clear
echo "===== Meu Primeiro Script ====="
echo ""
echo "Exibir data e hora atual: $DATAHORA "


# Leitura da lista de alunos
echo "==============================="
echo "Listagem dos Alunos: "
sort $ARQALUNOS


