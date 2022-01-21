[alias]
	alias = !git config --get-regexp ^alias\\. | sed -e s/^alias\\.// -e s/\\ /\\ =\\ /
	co = !git checkout $1 && git status
	l = !git log -n 8 --pretty=format:'%C(blue)%h %C(green)%<(14)%cr %C(cyan)%<(17)%cn%C(red)%d%C(white) %s'
	rc = !git commit -m \""$(fortune)\""

