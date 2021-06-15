#!/bin/bash

ssh ubuntu@$(sudo nmap -sP -n 192.168.1.0/24|grep $1 -B2|grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')