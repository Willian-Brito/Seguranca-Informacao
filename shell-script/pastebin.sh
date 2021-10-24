#!/bin/bash

##################################################################
#                                                                #
#   Visit my page on GitHub                                      #
#   https://github.com/Willian-Brito/Seguranca-Informacao.git    #
#                                                                #
#   Desenvolvedor: h1s0k4                                        #
#   E-mail: willian_brito00@hotmail.com                          #
#                                                                #
#   USAGE: ./pastebin "string"                                   #
#                                                                #
##################################################################

rm templinks templinks2 2>/dev/null >/dev/null
touch templinks
touch templinks2

extrai() {
# EXTRAI OS LINKS DO SITE | templinks
links="$(curl -s "https://pastebin.com/archive" | grep "i_p0" | cut -d"=" -f5 | cut -d'"' -f2 | tr -d "/")"
sleep 2
  for l in $links; do
    result="$(grep "$l" templinks)"
    if [ "$result" == "" ]; then echo $l >> templinks; fi
  done
}

acessa() {
# ACESSAR OS LINKS E FILTRAR OS QUE CONTÉM A PALAVRA PUBLIC | templinks2
for result in $1; do
  echo "$result" >> templinks2
  result2="$(curl -s "https://pastebin.com/raw/$result" | grep "$2")";
  if [ "$result2" != "" ]; then echo "https://pastebin.com/raw/$result"; fi;
  sleep 2
done
}

[ "$1" == "" ] && { clear; echo "[+] Uso: $0 \"string\""; exit; }
clear
echo "[+] Monitorando \"$1\" em pastebin.com"
echo
while :; do
  extrai
  links="$(diff templinks templinks2 | cut -d" " -f2 | grep -v ",")"
  acessa "$links" "$1"
  sleep 3
done
