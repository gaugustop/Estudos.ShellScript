#!/bin/bash

#=============================================================#
# Script de Bom Dia, Boa Tarde ou Boa Noite
#
# Autor: Gabriel Pinho
# Data de criação: 18/08/2022
# 
# Caso de uso: ./HoraAtual.sh
#
#=============================================================#

HORA=$(date | cut -c17-18)
XM=$(date | cut -c26-27)
HORAMINUTO=$(date | cut -c17-27)

if test $HORA -ge 6 -a $XM = "AM"
then
	echo "Bom dia!"
elif test $HORA -lt 6 -a $XM = "PM"
then
	echo "Boa tarde!"
else
	echo "Boa noite!"
fi
echo
echo "A hora tual é: $HORAMINUTO"	

