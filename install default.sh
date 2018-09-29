apt-get install openssh-server -y
aptitude

aptitude install vim xdotool ruby curl -y

gem install rmate

mkdir /root/.ssh

##adding plex
echo deb https://downloads.plex.tv/repo/deb ./public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -

##adding sync
echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list
wget -qO - https://linux-packages.resilio.com/resilio-sync/key.asc | sudo apt-key add -

##adding variety
sudo add-apt-repository ppa:peterlevi/ppa

##adding sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

aptitude install plexmediaserver resilio-sync variety sublime-text-3 apache2 php7.0 libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php7.0-cgi phpmyadmin php-gd php-mbstring php-mcrypt php-xml php-xmlrpc fortune arp-scan


## configure apache
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo systemctl restart apache2

## configure php
sudo mkdir /var/log/php
sudo chown www-data /var/log/php
sudo subl /etc/apache2/mods-enabled/dir.conf
sudo systemctl restart apache2

aptitude install mysql-server
##modificar editor de texto padrão
##sudo update-alternatives --config editor

## mysql workbench known-hosts:
##C:\Users\%USERPROFILE%\AppData\Roaming\MySQL\Workbench\ssh
## mysql -u root -p
## CREATE USER 'novousuario'@'localhost' IDENTIFIED BY 'password';
## GRANT ALL PRIVILEGES ON * . * TO 'novousuario'@'localhost';
## FLUSH PRIVILEGES;

##habilitar compartilhamento de pastas - samba

## criar senha para root
## /etc/ssh/sshd_config -> PermitRootLogin yes -> service ssh reload
##enviar chave de autenticação

