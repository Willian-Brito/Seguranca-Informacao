#!/bin/bash

#######################################################################
#                                                                     #
#   Visit my page on GitHub                                           #
#   https://github.com/Willian-Brito/Seguranca-Informacao.git         #
#                                                                     #
#   Desenvolvedor: h1s0k4                                             #
#   E-mail: willian_brito00@hotmail.com                               #
#                                                                     #
#   USAGE: ./rainbow-tables wordlist.txt -> wordlist.txt.final        #
#                                                                     #
#  GERANDO UMA HASH(MD5) QUALQUER: echo -n "admin" | md5sum           #
#                                                                     #
#  Depois só Usar o Seguinte Comando: grep "hash" wordlist.txt.final  #
#                                                                     #
#######################################################################

# MÉTODO DE RAINBOW-TABLES
if [ "$1" == "" ]; then
  echo
  echo "Uso: $0 wordlist.txt"
  exit
fi

dos2unix $1 >> /dev/null

for palavra in $(cat $1); do
  md5="$( echo -n "$palavra" | md5sum | cut -d" " -f1)"
  b64="$( echo -n "$palavra" | base64)"
  sha256="$( echo -n "$palavra" | sha256sum | cut -d" " -f1)"

  echo "$palavra:$md5:$b64:$sha256"
done >> temp$1

cat temp$1 | column -s: -t >> "$1.final"
rm temp$1
