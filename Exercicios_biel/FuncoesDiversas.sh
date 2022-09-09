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

#variaveis globais para o script:
DATA=$(echo $2 | tr -d "/") #input DDMMYYYY ou DD/MM/YYYY
DD=$(echo $DATA | cut -c1-2)
MM=$(echo $DATA | cut -c3-4)
YYYY=$(echo $DATA | cut -c5-)

f () {
	#local DATA=$(echo $1 | tr -d "/")
	#local DD=$(echo $DATA | cut -c1-2)
	#local MM=$(echo $DATA | cut -c3-4)

	if [ $DD -le 12 -a $MM -le 12 ] 
	then #nao eh possivel determinar
		echo "não é possivel determinar"
		return 2
	elif [ $DD -le 31 -a $MM -le 12 ]
	then #formato BR
		echo "formato BR"
		return 0
	elif [ $DD -le 12 -a $MM -le 31 ]
	then #formato US
		echo "formato US"
		return 1
	else
		echo "data invalida"
		return 3
	fi
}

i () {
	echo $MM/$DD/$YYYY
}

b () {
	echo $DD/$MM/$YYYY
}

e () {
	case $MM in
		01)
			MES="Janeiro"
			;;
		02)
			MES="Fevereiro"
			;;
		03)
			MES="Março"
			;;
		04)
			MES="Abril"
			;;
		05)
			MES="Maio"
			;;
		07)
			MES="Junho"
			;;
		08)
			MES="Julho"
			;;
		09)
			MES="Agosto"
			;;
		10)
			MES="Setembro"
			;;
		11)
			MES="Novembro"
			;;
		12)
			MES="Dezembro"
			;;
		*)
			echo "Mês inválido"
			return 5
	esac
	echo "$DD de $MES de $YYYY"

}

#fluxo do script
case $1 in 
	-f)
		f
		;;
	-i)
		i
		;;
	-b)
		b
		;;
	-e)
		e
		;;
	--help)
		echo "Uso $0 OPÇÃO DATA"
		echo
		echo "DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /"
		echo
		echo "Opções:"
		echo "-f = Retorna 0 para BR, 1 para US e 2 quando impossível determinar, 3 Inválido"
		echo "-i = Inverte formato BR para US e US para BR. Inclui as Barras"
		echo "-b = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981"
		echo "-e = Exibe a data em formato extenso. Exemplo de 13081918 para 13 de Agosto de 1981"
	
esac

