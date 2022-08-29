#!/bin/bash

#================
# Script soma
#===============
#echo -n  "digite dois valores para serem somados: " 
#read VAL1 VAL2
read -p "digite dois valores para serem somados: " VAL1 VAL2
SOMA=$(expr $VAL1 + $VAL2)
echo "A soma dos valores é: $SOMA"
