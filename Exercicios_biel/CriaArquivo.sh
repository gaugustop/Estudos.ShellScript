#!/bin/bash

#=======================================================
#
# Script: CriaArquivo.sh
#
# Autor: Gabriel Pinho
# Data: 25/08/2022
#
# Descrição: Cria um arquivo com caracteres fornecidos 
#            até que um tamanho seja atingido.
# 
# Uso: ./CriaArquivo.sh
#
#=======================================================

read -p "Informe o nome do arquivo a ser criado: " NOME
read -p "Informe o conjunto de caracteres que será usado para preencher o arquivo: " CARACTERES
read -p "Informe o tamanho final do arquivo em bytes: " TAMANHO_FINAL

cat /dev/null > $NOME #deixar o arquivo vazio!

touch $NOME
TAMANHO=$(du --bytes $NOME | cut -f1)
TAMANHO_FINAL_10=$(expr $TAMANHO_FINAL / 10)
STEP=1
for TAMANHO_STEP in $(seq $TAMANHO_FINAL_10 $TAMANHO_FINAL_10 $TAMANHO_FINAL)
do
	while [ $TAMANHO -lt $TAMANHO_STEP ]
	do
		echo -n $CARACTERES >> $NOME
		TAMANHO=$(du --bytes $NOME | cut -f1)
	done #fim do while
	echo "Concluído "$STEP"0% - Tamanho do arquivo: $TAMANHO"
	STEP=$(expr $STEP + 1)
done

