#!/bin/bash
#=======================================================================
#
# Nome do script: FuncoesDiversas.sh
#
# Autor: Gabriel Pinho
# Data: 29/08/2022
#
# Descricao: recebe uma opcao e uma data e realiza diversas ações
# Uso ./FuncoesDiversas.sh -f 08121987
#
#=======================================================================

f () {
	DATA=$(echo $1 | tr -d "/")
	DD=$(echo $DATA | cut -c1-2)
	MM=$(echo $DATA | cut -c3-4)

	if [ $DD -le 12 -a $MM -le 12 ] 
	then #nao eh possivel determinar
		return 2
	elif [ $DD -le 31 -a $MM -le 12 ]
	then #formato brasileiro
		return 0
	elif [ $DD -le 12 -a $MM -le 31 ]
	then #formato US
		return 1
	else
		echo "data invalida"
		return 3
	fi
}

f $1
echo $?
