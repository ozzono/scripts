# Set up the prompt

# history config
SAVEHIST=5000
HISTSIZE=2000
HISTFILE=~/.zsh_history
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

setopt histignorealldups sharehistory
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE
setopt AUTO_CD
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

autoload -U colors
colors

autoload -Uz compinit
compinit

# up-arrow complete
bindkey '^[OA' up-line-or-search                                                
bindkey '^[OB' down-line-or-search

# ctrl+left or ctrl-right word hop
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# git branch exhibition config
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Enable substitution in the prompt.
bullet="●"

zstyle ':vcs_info:*' stagedstr $bullet
zstyle ':vcs_info:*' unstagedstr $bullet
zstyle ':vcs_info:*' unmergedstr $bullet
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats '%F{5}%F{2}branch:%b%F{5} %F{2}%c%F{3}%u%f '
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git 
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
            hook_com[unstaged]+='%F{1}●%f' 
    fi
}

precmd () { vcs_info }
PROMPT='%F{5}$fg[blue]%}%n@%m %F{3}%3~ %F{7}${vcs_info_msg_0_}%#'$'\n'

zstyle ':omz:update' mode reminder
ZSH_DISABLE_COMPFIX=true
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
HYPHEN_INSENSITIVE=true

eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

echo "\t"
if [ -f ~/.zsh_aliases ]; then
    date +"%Y-%m-%d %H:%M:%S loading aliases"
    . ~/.zsh_aliases
fi

if [ -f ~/.zsh_custom ]; then
    date +"%Y-%m-%d %H:%M:%S loading customizations"
    . ~/.zsh_custom
fi

if [[ -v VSCODE_WS ]] && [[ "$VSCODE_WS" != '${workspaceFolder}' ]]; then
    alias cd="HOME=\"${VSCODE_WS}\" cd"
fi


export DISPLAY=":0.0"
xhost +