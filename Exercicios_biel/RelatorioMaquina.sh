#!/bin/zsh

#===================================================================
#
# Script: Relatório de informações da máquina atual
#
# Autor: Gabriel Pinho
# Data: 10/08/2022
# 
# Descrição: Mostra informações importantes sobre a máquina atual
# Caso de uso: 
#
#===================================================================

echo "============================================================="
echo "Relatório da Máquina: $(hostname)"
echo "Data/Hora: $(date)"
echo "============================================================="
echo ""
echo "Máquina ativa por: $(uptime | cut -d ' ' -f 4 | tr , H)"
echo "Versão do Kernel: $(uname)"
echo ""
echo "CPUs:"
echo $(lscpu | grep "Model name")
echo "Número de Núcleos: $(lscpu | grep "CPU(s)" | head -n1 | cut -d: -f2 | tr -s ' ')"
echo ""
echo "Memória"
echo "$(free -h)"
echo ""
echo "Particoes"
echo "$(df -h | egrep -v '(tmpfs|udev|not)')"
   
