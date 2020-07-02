#/bin/bash

## all git repositories
mkdir $HOME/Projects;
mkdir $HOME/scripts;
cd $HOME/Projects;
git clone https://github.com/synini/ifbra-app.git
git clone https://github.com/synini/adbtools.git
git clone https://github.com/synini/go-snippets.git

cd $HOME/scripts
git clone https://github.com/synini/scripts.git

cp $HOME/scripts/.bash_aliases $HOME/.
source $HOME/.profile