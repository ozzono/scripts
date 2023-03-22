[alias]
 alias = !git config --get-regexp ^alias\\. | sed -e s/^alias\\.// -e s/\\ /\\ =\\ /
 co    = !git checkout $1 && git status
 l     = !git --no-pager log -n 8 --pretty=format:'%C(blue)%h %C(green)%<(14)%cr %C(cyan)%<(17)%cn%C(red)%d%C(white) %s'
 rc    = !git add . && git commit -m \"Fortune Commit: "$(fortune)\"" && git push
 p     = !git push
 a     = !git add
 al    = !git add .
 new   = !git branch -b
 pobs  = !git add . && git commit -m '$(date +"%Y-%m-%d %H:%M:%S")'
 ac    = !git add . && git commit -m 
 sr    = !git reset --soft HEAD~ 
 hr    = !git reset --hard