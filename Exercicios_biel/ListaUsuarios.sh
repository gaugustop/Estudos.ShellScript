#!/bin/bash

#================================================================
#
# Nome: Lista Usuários da Máquina
#
# Autor: Gabriel Pinho
# Data: 25/08/2022
#
# Descrição: Lista os usuários humanos da máquina com algumas
#            informações
#
# Uso: ./ListaUsuarios.sh
#
#================================================================

IFSOLD=$IFS
IFS=$'\n'
# grep "^UID_MAX" /etc/login.defs | tr -s "\t" | cut -f2 #poderia ser assim também!
UID_MAX=$(cat /etc/login.defs | grep UID_MAX | grep -v SYS | cut -f4 | tr -d " ")
UID_MIN=$(cat /etc/login.defs | grep UID_MIN | grep -v SYS | cut -f4 | tr -d " ")

#debug
#echo UID_MAX: $UID_MAX
#echo UID_MIN: $UID_MIN

echo -e "USUARIO\t\tUID\t\tDIR HOME\t\tNOME OU DESCRICAO"

for LINHA in $(cat /etc/passwd) 
do
	VAR_UID=$(echo $LINHA | cut -d: -f3)
	if [ $VAR_UID -ge $UID_MIN -a $VAR_UID -le $UID_MAX ]
	then
		VAR_USUARIO=$(echo $LINHA | cut -d: -f1)
		VAR_DIRHOME=$(echo $LINHA | cut -d: -f6)
		VAR_DESCRIC=$(echo $LINHA | cut -d: -f5 | tr -d ',')
		echo -e "$VAR_USUARIO\t\t$VAR_UID\t\t$VAR_DIRHOME\t\t$VAR_DESCRIC"
	fi
done

IFS=$IFSOLD
unset IFSOLD

