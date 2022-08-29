#!/bin/bash

#==========================================================================
#
# Script: Operações com valores
# Autor: Gabriel Pinho
# Data: 22/08/2022
# Descrição: Faz uma operação matematica definida com valores
#            definidos pelo usuário
# Uso: ./OperacoesValores.sh
#
#==========================================================================

read -p "Informe o valor 1: " VAR1
read -p "Informe o valor 2: " VAR2

if test ! $VAR1 || test ! $VAR2
then
	echo "Nenhum dos calores pode ser vazio!"
	exit 1
fi

echo
echo "Escolha uma Operação:"
echo "1 = Soma"
echo "2 = Subtração"
echo "3 = Multiplicação"
echo "4 = Divisão"
echo "Q = Sair"
echo -n "Opção: "
read -n1 OP
echo

case $OP in
	1) 
		echo "$VAR1 + $VAR2 = $(expr $VAR1 + $VAR2)" 
		;;
	2)
		echo "$VAR1 - $VAR2 = $(expr $VAR1 - $VAR2)"
		;;
	3)
		if test $VAR1 -eq 0 -o $VAR2 -eq 0
		then
			"um valor 0 (zero) não pode ser usado na multiplicação!"
			exit 1
		fi
		echo "$VAR1 * $VAR2 = $(expr $VAR1 \* $VAR2)"
		;;
	4)
		
		if test $VAR1 -eq 0 -o $VAR2 -eq 0
		then
			"um valor 0 (zero) não pode ser usado na divisão!"
			exit 1
		fi
		echo "$VAR1 / $VAR2 = $(expr $VAR1 / $VAR1)"
		echo "Resto da divisão: $(expr $VAR1 % $VAR2)"
		;;
	[Qq])
		exit 1
		;;
	*)
		echo "Opção inválida!"
		exit 1
		;;
esac

