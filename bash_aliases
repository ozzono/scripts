alias rset="source $HOME/.profile"
alias suuu="screen -dmS suuu bash -c 'sudo aptitude update && sudo aptitude upgrade -y && sudo $HOME/scripts/clean_snap.sh && exit'&& screen -r suuu"
alias psef="ps -ef |grep $1"
alias vueui="$HOME/scripts/vueui.sh"
alias cdnotes="cd $HOME/Projects/notes"
alias cdifbra="cd $HOME/Projects/ifbra-app"
alias cdscripts="cd $HOME/scripts"
alias cdprojects="cd $HOME/Projects"
alias cppayment="cd $HOME/Projects/payment"
alias cdomint="cd $HOME/Projects/omint-app-flow"
alias snippets="cd $HOME/Projects/snippets"
alias go-snippets="cd $HOME/Projects/snippets/go-snippets"
alias cdvue="cd $HOME/Projects/vue-snippets"
alias pack="$HOME/scripts/pack_extension.sh"
alias rbind="bind '\"\e[A\":history-search-backward' && bind '\"\e[B\":history-search-forward'"
alias realias="code $HOME/.bash_aliases"
alias home-server="ssh home@192.168.1.50"
alias dev-server="ssh dev@192.168.1.50"
alias foxkill="kill $(pidof firefox)"
alias lsdisk='lsblk -o name,mountpoint,label,size,fstype,uuid | egrep -v "^loop"'
alias gocmd="go run /home/hugo/Projects/snippets/go-snippets/gocmd.go"
alias cdjetgrowth="cd $HOME/Projects/Jetgrowth"
alias kscreen="screen -XS $1 kill"
alias anbox-launch="screen -dmS anbox bash -c 'anbox launch --package=org.anbox.appmgr --component=org.anbox.appmgr.AppViewActivity'"
alias anbox-kill="sudo snap restart anbox"
alias lite-avd="screen -dmS lite-avd bash -c '/home/hugo/Android/Sdk/emulator/emulator -avd lite'"
alias lite-avd-kill="screen -X -s lite-avd kill"
alias vetest="go vet ./... && go test -v"
alias xml2tap="go run $HOME/Projects/snippets/go-snippets/xml2tap.go"
alias codei="code-insiders"
alias rcommit="git commit -m 'Random Commit: `fortune`'"