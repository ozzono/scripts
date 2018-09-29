#!/bin/bash

re='^[0-9]+$'

if ! [[ $1 =~ $re ]] ; then
   echo "error: numeric argument required" >&2; exit 1;
fi

cp /home/ozono/.bash_aliases /home/ozono/.bash_aliases.tmp
sed '$ d' /home/ozono/.bash_aliases.tmp > /home/ozono/.bash_aliases
rm -f .bash_aliases.tmp;

echo 'alias oneirossh="ssh -R 52698:localhost:52698 root@192.168.1.'$1'"' >> /home/ozono/.bash_aliases;
echo 'SSH alias access for Oneiros succesfully updated to 192.168.1.'$1;
exec bash;

##do not remove these lines
##eof 