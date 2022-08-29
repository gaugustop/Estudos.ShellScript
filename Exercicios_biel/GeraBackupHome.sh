#!/bin/bash

#==============================================================
# Script GeraBackupHome.sh
#
# Autor: Gabriel Pinho
# Criacao: 18/08/2022
#
# Descricao: Faz um backup da home do usuário
#
# Uso: ./GeraBackupHome.sh
#==============================================================

DIRETORIO=$HOME/Documents
DIRETORIO_BACKUP=$DIRETORIO/Backup

#cria o diretorio caso ele não exista
if test ! -d $DIRETORIO_BACKUP
then
	echo "Diretório $DIRETORIO_BACKUP não exite. Criando..."
	mkdir  -p $DIRETORIO_BACKUP

fi

#checa se já existe algum backup na ultima semana
DAYS7=$(find $DIRETORIO_BACKUP -ctime -7 -name backup_\*.tgz) 

if test "$DAYS7"
then
	echo "Já foi gerado um backup do diretório $DIRETORIO nos últimos 7 dias."
	echo -n "Deseja continuar (N/s): "
	read -n1 CONTINUE
	if test $CONTINUE = N -o $CONTINUE = n -o $CONTINUE = ""
	then
		echo
		echo "Backup abortado!"
		exit 1
	elif test $CONTINUE = S -o $CONTINUE = s
	then
		echo "Será criado mais um backup para a semana!"
	else
		echo "Opção inválida!"
		exit 2
	fi
fi

#cria o backup
echo "Criando backup..."
ARQ="backup_$(date +%Y%m%d%H%M).tgz"
tar zcvpf $DIRETORIO_BACKUP/$ARQ --absolute-names --exclude="$DIRETORIO_BACKUP" "$DIRETORIO"/* > /dev/null
echo
echo "Backup $DIRETORIO_BACKUP/$ARQ criado!"
