#/bin/bash

## all apt repositories packages
sudo apt-get update && sudo apt-get install aptitude -y;
sudo aptitude install openssh-server snapd screen tmux vim ffmpeg members qemu-kvm curl net-tools git xclip fortune -y;

## if configuring personal workstation
sudo aptitude install gnome-tweaks chrome-gnome-shell -y;


## all snap packages
sudo snap install node --channel=12/stable --classic;
sudo snap install code --classic;
sudo snap install android-studio --classic;
sudo snap install go --classic
sudo aptitude upgrade -y;

## install vue
npm install -g --scripts-prepend-node-path @vue/cli
