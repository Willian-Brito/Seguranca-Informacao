
#!/bin/bash

##################################################################
#                                                                #
#   Visit my page on GitHub                                      #
#   https://github.com/Willian-Brito/Seguranca-Informacao.git    #
#                                                                #
#   Desenvolvedor: h1s0k4                                        #
#   E-mail: willian_brito00@hotmail.com                          #
#                                                                #
#   USAGE: ./limpeza                                             #
#                                                                #
##################################################################

echo "Limpando a Lixeira .."
sudo rm -rf /home/$USER/.local/share/Trash/files/*
echo ""
echo ""
echo "Limpando a pasta /tmp .."
sudo rm -rf /var/tmp/*
echo ""
echo ""
echo "Exclusão de cache inuteis do sistema e Cópias de Atualização .."
sudo apt-get clean -y
echo ""
echo ""
echo "Exclusão de programas que não estão sendo Utilizados .."
sudo apt-get autoremove -y
echo ""
echo ""
echo "Exclusão de Arquivos Duplicados .."
sudo apt-get autoclean -y
echo ""
echo ""
echo "Reparando pacotes Quebrados .."
sudo dpkg --configure -a
echo ""
echo ""
clear
echo "Limpeza Concluida com Sucesso !!"
sleep 4
exit