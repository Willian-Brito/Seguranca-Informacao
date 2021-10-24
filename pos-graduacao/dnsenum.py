#! /usr/bin/python
# -*- coding:utf-8 -*-

#####################################################
#                                                   #
#   UNICIV - Centro de Inovação VincIT              #
#   https://www.uniciv.com.br                       #
#                                                   #
#   Desenvolvedor: h1s0k4                           #
#   E-mail: willian_brito00@hotmail.com             #
#                                                   #
#   USAGE: python dnsenum.py <DOMINIO>              #
#                                                   #
#####################################################

import socket
import sys

domain = sys.argv[1]
names = ['ns1', 'ns2', 'www', 'ftp', 'intranet']

for name in names:
	dns = name + "." + domain
	try:	
		print dns + ":" + socket.gethostbyname(dns)
	except socket.gaierror:
		print "Este nao é valido"
		pass