#!/bin/bash

#Esse script compara o ip atual da máquina 10:c3:7b:c1:79:87 e o ip utilizado pelo Synergy para se conectar

#Se estiverem diferentes o script mata os processos em execução e chama o synergy direcionando para o ip correto

log_file='/home/administrador/Documents/logs/reconnect_synergy.log'
new_date=`date +%Y.%m.%d\ %H:%M:%S`;
mac_address="10:c3:7b:c1:79:87";
new_ip=`sudo arp-scan -l | grep $mac_address | head -c 13 | tr -d " "`;
last_ip=`ps -ef | grep synergyc|grep 192|tail -c 13| tr -d " "`;

if [ -z "$last_ip" ]; then
	if [ -z "$new_ip" ]; then
		echo "$new_date: Mac Address $mac_address não encontrado" >> $log_file;
	else
		echo "$new_date: Iniciando Synergy no ip $new_ip" >> $log_file;
		synergyc $new_ip > /dev/null 2>&1;
	fi
else
	{
	if [ $last_ip != $new_ip ]; then
		killall synergyc && synergyc $new_ip;
		echo "$new_date: IPs diferentes; Configuração renovada" >> $log_file;
		echo "    antigo: $last_ip | Ip novo:$new_ip" >> $log_file;
	else
		echo "$new_date: IPs iguais; Configuração mantida" >> $log_file;
		echo "    Ip mantido:"$new_ip >> $log_file;
	fi
	}
fi


