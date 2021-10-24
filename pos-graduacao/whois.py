#! /usr/bin/python
# -*- coding:utf-8 -*-
# pip install python-whois

#####################################################
#                                                   #
#   UNICIV - Centro de Inovação VincIT              #
#   https://www.uniciv.com.br                       #
#                                                   #
#   Desenvolvedor: h1s0k4                           #
#   E-mail: willian_brito00@hotmail.com             #
#                                                   #
#   USAGE: python whois.py <DOMINIO>                #
#                                                   #
#####################################################

import whois
import sys

domain = sys.argv[1]
print domain

consulta = whois.whois(domain)
print consulta.email
print consulta['owner']
print consulta.text