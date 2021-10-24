#!/bin/bash

##################################################################
#                                                                #
#   Visit my page on GitHub                                      #
#   https://github.com/Willian-Brito/Seguranca-Informacao.git    #
#                                                                #
#   Desenvolvedor: h1s0k4                                        #
#   E-mail: willian_brito00@hotmail.com                          #
#                                                                #
#   USAGE: ./h1s0k4_crypter "willian" -> 4T36V54R60S90I156E91M@F #
#                                                                #
##################################################################


#__________________________________________________
# IF
# IGUAL:        ==
# DIFERENTE:    !=
# MAIOR (>):   -qt
# MENOR (<):   -lt

# SINTAXE 1
# for ((cont= 0; cont< 10; cont++)); do
      #COMANDOS
#done

# SINTAXE 2
# for cont in $(seq 10); do
      #COMANDOS
#done
#__________________________________________________

# Função que troca letra pelo Equivalente Numérico
num() { echo "a b c d e f g h i j k l m n o p q r s t u v w x y z" |  cut -d"$1" -f1 | tr " " "\n" | wc -l; }

# Função que troca espaço por letra Aleatória
letraAleatoria() { echo "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z" |  cut -d" " -f$((($RANDOM%25)+1)); }

if [ "$1" == "" ]; then exit; fi

ent=$1
echo
echo "Palavra Original: $ent"
echo

#PASSO 1: (SUBSTITUI LETRAS NA ORDEM INVERSA)
p1="$( echo $ent | tr "abcdefghijklmnopqrstuvwxyz" "zyxwvutsrqponmlkjihgfedcba" )"

#PASSO 2 (TROCA ESPAÇO POR ':')
p2="$( echo $p1 | tr " " ":")"

#PASSO 3 (TROCA QUEBRA DE LINHA POR '@')
p3="$( echo $p2 | tr "\n" "@")"

#PASSO 4 (SEPARA OS CARACTERES POR ESPAÇO PEGA CADA LETRA PELO
#         EQUIVALENTE NUMÉRICO)
p4="$( for cont in $(seq $( echo -n "$p3" | wc -c)); do
  carac="$( echo "$p3" | cut -b $cont;)"
  
#VERIFICAR SE É LETRA
il="$( echo $carac | grep "[a-z]")"

if [ "$il" != "" ]; then
  num $carac
else
  echo "$carac"
fi
done | tr "\n" " ")"


#PASSO 5 ( MULTIPLICA O PRIMEIRO NUMERO QUE EQUIVALE AO PRIMEIRO
#         CARACTER POR 1 DEPOIS POR 2 E ASSIM SUCESSIVAMENTE ATÉ
#         MULTIPLICAR TODOS CARACTERES DEPOIS TROCA OS ESPAÇOS E
#         SEPARA CADA NUMERO QUE EQUIVALE CADA CARACTER POR UMA
#         LETRA ALEATÓRIA )
p5="$( for cont in $p4; do
  #VERIFICAR SE É NUMERO
  in="$( echo $cont | grep "[1-9]")"

  if [ "$in" != "" ]; then
    let count++
    echo -n $(($cont*$count))$(letraAleatoria)
  else
    echo -n $cont$(letraAleatoria)
  fi
done )"

echo $p5
echo
