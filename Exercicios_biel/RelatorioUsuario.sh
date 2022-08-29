#!/bin/bash
#==================================
# Script de informações do usuário
#==================================


USER_INFO=$(cat /etc/passwd | grep $1)
#USER_INFO=$(grep $1 /etc/passwd)
#biel:x:1000:1000:Gabriel Pinho,,,:/home/biel:/usr/bin/zsh
USER_ID=$(echo $USER_INFO | cut -d: -f3)
USER_NAME=$(echo $USER_INFO | cut -d: -f5 | cut -d, -f1)
USER_HOME=$(echo $USER_INFO | cut -d: -f6)
USER_HOME_USE=$(du -sh $USER_HOME | cut -d/ -f1)

echo "====================================================================="
echo "Relatório do usuário: $1"

#tratamento de erro: usuário não encontrado!
ls /home/$1 > /dev/null 2>&1 || { echo "Usuario inexistente!" ; exit 1; }

echo
echo "UID: $USER_ID"
echo "Nome ou descrição: $USER_NAME"
echo "Total usado no $USER_HOME: $USER_HOME_USE"
echo 
echo "Ultimo Login"
echo "$(lastlog -u $1)"
echo "====================================================================="
