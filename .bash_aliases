foxkill(){
    f=$(pidof firefox)
    if [[ -z "$f"  ]]; then
        echo "foxkill: no firefox service running"
    else
        echo "foxkill: killing all firefox services"
        sudo kill $f
    fi
}

reb(){
    dockkill
    echo "reb: rebooting"
    sudo reboot;
}

dockkill(){
    echo "dockkill: killing all docker containers"
    d=$(docker ps -a -q)
    if [[ -z "$d"  ]]; then
        echo "dockkill: no docker containers running"
    else
        sudo docker stop $d && sudo docker rm $d;
    fi
}

alias rset="source $HOME/.profile"
alias suuu="sudo aptitude update && sudo aptitude upgrade -y && sudo $HOME/scripts/clean_snap.sh && exit"
alias psef="ps -ef |grep $1"
alias vueui="$HOME/scripts/vueui.sh"
alias cdnotes="cd $HOME/Projects/notes"
alias cdscripts="cd $HOME/scripts"
alias cdprojects="cd $HOME/Projects"
alias go-snippets="cd $HOME/Projects/snippets/go-snippets"
alias rbind="bind '\"\e[A\":history-search-backward' && bind '\"\e[B\":history-search-forward'"
alias realias="code $HOME/.bash_aliases"
alias home-server="ssh home@192.168.1.50"
alias dev-server="ssh dev@192.168.1.50"
alias lsdisk='lsblk -o name,mountpoint,label,size,fstype,uuid | egrep -v "^loop"'
alias gocmd="go run /home/hugo/Projects/snippets/go-snippets/gocmd.go"
alias kscreen="screen -XS $1 quit"
alias anbox-launch="screen -dmS anbox bash -c 'anbox launch --package=org.anbox.appmgr --component=org.anbox.appmgr.AppViewActivity'"
alias anbox-kill="sudo snap restart anbox"
alias lite-avd="screen -dmS lite-avd bash -c '/home/hugo/Android/Sdk/emulator/emulator -avd lite'"
alias lite-avd-kill="screen -X -s lite-avd kill"
alias vetest="go vet ./... && go test -v"
alias xml2tap="go run $HOME/Projects/snippets/go-snippets/xml2tap.go"
alias codei="code-insiders"

alias ifconf="ifconfig eno1"
alias dcc="docker-compose"
alias mkae="make"
alias amke="make"
alias maek="make"
alias cd..="cd .."
alias dfh='df -h | grep -v "loop"'
alias cl="clear && clear"
