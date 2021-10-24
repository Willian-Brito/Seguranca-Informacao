#!/bin/bash

##################################################################
#                                                                #
#   Visit my page on GitHub                                      #
#   https://github.com/Willian-Brito/Seguranca-Informacao.git    #
#                                                                #
#   Desenvolvedor: h1s0k4                                        #
#   E-mail: willian_brito00@hotmail.com                          #
#                                                                #
#   USAGE: ./anti-deface &                                       #
#                                                                #
##################################################################

# LEMBRAR DE RENOMEAR backupIndex.sh
# EXECUTAR EM PLANO DE FUNDO: (COLOCAR)& Depois do done
# disown <PID>

ho="$(md5sum index.html | cut -d" " -f1)";
mkdir backup; cp index.html backup/indexBackup.html;
clear;

while :; do
  ha="$(md5sum index.html 2>/dev/null | cut -d" " -f1)";
  sleep 0.3;
  if [ "$ha" != "$ho" ]; then
    echo "[+] Recuperando Arquivo Original"; cp backup/indexBackup.html ./index.html;
  fi
done
