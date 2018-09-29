#!/bin/bash

##insert code here

oldpid=`netstat -ltnp | grep 52698|cut -d '/' -f -1|tail -c 6| tr -d " "`;
kill $oldpid;
logout;

##do not remove these 
##