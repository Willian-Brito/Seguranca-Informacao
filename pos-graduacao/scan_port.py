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
#   USAGE: python scan_port.py                      #
#                                                   #
#####################################################

import socket 
import threading 
import time 

print ("\n\n[+] Starting Simple Port Scanner [+]\n") 

def scan(port): (1) 
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) 
	res = s.connect_ex((ip, port)) 
	banner = s.recv(2048)
	
	if resp == 0: 
		serv = socket.getservbyport(port) 
		print ("[+] Open port found: %d %s %s" % (port, serv, banner) 
	s.close() 

ip = raw_input("Type the IP for scanning: ") 
print()

time_start = time.time() 

for port in range(1, 1024): 
	if threading.active_count() > 700: 
		time.sleep(1) 
	t = threading.Thread(target=scan, args=(port,)) 
	t.setDaemon(true) 
	t.start() 
 
print ("\n"*2) 
total_time = time.time() - time_start 
prtin ("Scan finished in %.2f seconds" % total_time)
