#!/bin/bash

#=============================================================#
# Script de Bom Dia, Boa Tarde ou Boa Noite
#
# Autor: Gabriel Pinho
# Data de criação: 18/08/2022
# 
# Descricao: faz a saudação correta e mostra a hora  
# Uso: ./HoraAtual.sh
#
#=============================================================#

HORA=$(date +%H)
#HORA=$1
MINUTO=$(date +%M)

# Case para definir o período
# Estou considerando que o dia começa às 06h00

case $HORA in
	0[6-9] | 1[01])
		echo "Bom dia!"
		;;
	1[2-7])
		echo "Boa tarde!"
		;;
	*)
		echo "Boa noite!"
		;;
esac

#If para reduzir a hora e definir AMPM
if test $HORA -gt 12
then
	XM=PM
	if test $HORA -ne 12
	then
		HORA=$(expr $HORA - 12)
	fi
else
	XM=AM
fi
echo
echo "A hora atual é $HORA:$MINUTO $XM"


