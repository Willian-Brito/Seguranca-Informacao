#!/bin/bash

##################################################################
#                                                                #
#   Visit my page on GitHub                                      #
#   https://github.com/Willian-Brito/Seguranca-Informacao.git    #
#                                                                #
#   Desenvolvedor: h1s0k4                                        #
#   E-mail: willian_brito00@hotmail.com                          #
#                                                                #
#   USAGE: ./ping                                                #
#                                                                #
##################################################################

for i in $(seq 1 255);
do 
	ping -c1 192.168.0.$i | grep "64 bytes" | cut -d":" -f1 | cut -d" " -f4 ;
done

# for i in $(seq 1 255); do ping -c1 192.168.0.$i | grep "64 bytes" | cut -d":" -f1 | cut -d" " -f4 ; done
