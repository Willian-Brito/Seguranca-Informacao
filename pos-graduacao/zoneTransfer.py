#! /usr/bin/python
# -*- coding:utf-8 -*-

#pip install dns-python

#####################################################
#                                                   #
#   UNICIV - Centro de Inovação VincIT              #
#   https://www.uniciv.com.br                       #
#                                                   #
#   Desenvolvedor: h1s0k4                           #
#   E-mail: willian_brito00@hotmail.com             #
#                                                   #
#   USAGE: python zoneTransfer.py <DOMINIO>         #
#                                                   #
#####################################################

import dns.query
import dns.zone
import dns.resolver
import sys

domain = sys.argv[1]
nsRegister = dns.resolver.query(domain, "NS")

list = []
for register in nsRegister:
	list.append(str(register))

for register in list:
	try:
		zoneTransfer = dns.zone.from_xfr(dns.query.xfr(register, domain))
	except Exception as e:
		print e
	else:
		dnsRegister = zoneTransfer.nodes.keys()
		dnsRegister.sort()
		for n in dnsRegister:
			print zoneTransfer[n].to_text(n)
