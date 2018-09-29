#!/bin/bash
#script para adicionar alias
#syntax: addlias $arg1 $arg2 sendo arg1 o nome do alias e arg 2 o comando do alias
user=`whoami`;
cat /home/$user/.bash_aliases >> /home/$user/.alias.tmp;
echo "alias $1=\"$2\""  > /home/$user/.bash_aliases;
cat  /home/$user/.alias.tmp >> /home/$user/.bash_aliases;
rm /home/$user/.alias.tmp;