#/bin/bash

## all apt repositories packages
sudo apt-get update && sudo apt-get install aptitude -y;
sudo aptitude install openssh-server snapd fping screen tmux vim ffmpeg members curl net-tools git xclip fortunes gnome-tweaks chrome-gnome-shell build-essential -y\
    # qemu-kvm \
    ;

## if configuring personal workstation


## all snap packages
sudo snap install node --classic;
sudo snap install code --classic;
sudo snap install android-studio --classic;
sudo snap install go --classic
sudo aptitude upgrade -y;

## install vue
npm install -g @vue/cli --scripts-prepend-node-path
