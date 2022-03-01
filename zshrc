# Set up the prompt

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
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

autoload -U colors
colors

autoload -Uz compinit
compinit
# Enabling and setting git info var to be used in prompt config.
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git svn
# # This line obtains information from the vcs.
# zstyle ':vcs_info:git*' formats "%b"
# precmd() {
#     vcs_info
# }

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Enable substitution in the prompt.

zstyle ':vcs_info:*' stagedstr '●' 
zstyle ':vcs_info:*' unstagedstr '●' 
zstyle ':vcs_info:*' unmergedstr '●' 
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
  '%F{5}%F{2}%b%F{5} %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git 
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
            hook_com[unstaged]+='%F{1}●%f'
    fi
}


precmd () { vcs_info }
PROMPT='%F{5}$fg[blue]%}%n@%m %F{3}%3~ $fg[green]${vcs_info_msg_0_} %# '

zstyle ':omz:update' mode reminder
ZSH_DISABLE_COMPFIX=true
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
HYPHEN_INSENSITIVE=true
HIST_STAMPS="yyyy.mm.dd"

eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


echo "\t"
if [ -f ~/.zsh_aliases ]; then
    echo $(date +"%Y-%m-%d %H:%M:%S") "loading aliases"
    . ~/.zsh_aliases
fi

if [ -f ~/.zsh_custom ]; then
    echo $(date +"%Y-%m-%d %H:%M:%S") "loading customizations"
    . ~/.zsh_custom
fi