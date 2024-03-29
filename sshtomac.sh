#!/bin/bash

if [ -z "$4" ]; then
    ssh -i $3/.ssh/id_rsa $1@$(nmap -sP -n 192.168.1.0/24|grep $2 -B2|grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
else
    ssh -i $3/.ssh/id_rsa $1@$(nmap -sP -n 192.168.1.0/24|grep $2 -B2|grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') -p $4
fi