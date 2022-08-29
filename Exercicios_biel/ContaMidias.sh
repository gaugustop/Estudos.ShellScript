#!/bin/bash

#==========================================================
#
# Script: ContaMidias.sh
#
# Autor: Gabriel Pinho
# Data: 25/08/2022
#
# Descrição: Conta midias .mp3, .mp4 e .jpg nas homes dos
#            usuários
#
# Uso: ./ContaMidia.sh
#
#==========================================================

MIDIAS=".mp3 .mp4 .jpg .png"
for USUARIO in $(ls /home)
do
	echo Usuário: "$USUARIO"
	for MIDIA in $MIDIAS
	do
		CONT_MIDIA=$(find /home/$USUARIO -name "*$MIDIA" | wc -l)
		echo Arquivos $(echo $MIDIA | tr -d '.'): "$CONT_MIDIA" 
	done #fim do for para MIDIAS
	echo
done #fim do for para USUARIOS

