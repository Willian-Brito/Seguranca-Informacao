#!/usr/bin/python 
#!-*-coding:utf-8-*- 

#####################################################
#                                                   #
#   UNICIV - Centro de Inovação VincIT              #
#   https://www.uniciv.com.br                       #
#                                                   #
#   Desenvolvedor: h1s0k4                           #
#   E-mail: willian_brito00@hotmail.com             #
#                                                   #
#   USAGE: python ping.py                           #
#                                                   #
#####################################################

from scapy.all import *
import logging 
import netaddr 
 
logging.getLogger("scapy.runtime").setLevel(logging.ERROR) 
 
network = "192.168.0.1/24" 
 
addresses = netaddr.IPNetwork(network)
liveCounter = 0 
 
for host in addresses:
	if (host == address.network or host == address.broadcast): 
		continue 
	resp = sr1(IP(dst=str(host))/ICMP(),inter=0.1,timeout=1,verbose=0) 
	if (str(type(resp)) == "<type 'NoneType'>"): 
		print str(host) + " is down or not responding." 
	elif (int(resp.getlayer(ICMP).type)==3 and int(resp.getlayer(ICMP).code) in [1,2,3,9,10,13]): 
		print str(host) + " is blocking ICMP." 
	else: 
		print str(host) + " is responding" 
		liveCounter +=1 
print "Out of " + str(adresses.size) + " hosts, " + str(liveCounter) + " are online"