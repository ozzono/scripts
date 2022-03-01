# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

setopt histignorealldups sharehistory
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE
setopt AUTO_CD
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
SAVEHIST=5000
HISTSIZE=2000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit
[[ -r ~/.autopkg_complete/autopkg ]] && source ~/.autopkg_complete/autopkg

# partial completion suggestions
zstyle ':completion:*' list-suffixeszstyle ':completion:*' expand prefix suffix

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true

ZSH_THEME="aussiegeek/aussiegeek"

# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

echo "\t"
if [ -f ~/.zsh_aliases ]; then
    echo $(date +"%Y-%m-%d %H:%M:%S") "loading aliases"
    . ~/.zsh_aliases
fi

if [ -f ~/.zsh_custom ]; then
    echo $(date +"%Y-%m-%d %H:%M:%S") "loading customizations"
    . ~/.zsh_custom
fi
