#!/bin/bash
#
#====================================================================
#
# Script: MonitoraProcesso.sh
#
# Autor: Gabriel Pinho
# Data: 25/08/2022
#
# Descrição: Recebe um nome de processo como argumento e monitoa se 
#            ele está em execução.
#
# Uso: ./MonitoraProcesso.sh <nome_do_processo > &
#
#====================================================================

TIME=5

if [ $# -eq 0 ]
then
	echo "favor informar um processo como argumento"
	exit 1
fi

while true
do
	sleep $TIME
	if ps axu | grep $1 | grep -v grep | grep -v $0 > /dev/null #$0 é o nome do script 
	then
		continue
	else
		echo "O processo $1 não está em execução!!!"
	fi
done

