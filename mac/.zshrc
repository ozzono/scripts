# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


dead_screens=$(screen -ls |grep "???"|wc -l)

if [ $dead_screens != "0" ]; then
    date +"%Y-%m-%d %H:%M:%S dead screens: $dead_screens dead screens"
    screen -wipe
fi
# screen -wipe


if [ -f ~/.zsh_aliases ]; then
    date +"%Y-%m-%d %H:%M:%S loading aliases"
    . ~/.zsh_aliases
fi

if [ -f ~/.zsh_custom ]; then
    date +"%Y-%m-%d %H:%M:%S loading customizations"
    . ~/.zsh_custom
fi

if [[ -v VSCODE_WS ]] && [[ "$VSCODE_WS" != '${workspaceFolder}' ]]; then
    date +"%Y-%m-%d %H:%M:%S redirecting to ${VSCODE_WS}"
    alias cd="HOME=\"${VSCODE_WS}\" cd"
fi

# btrAlert=$(screen -ls|grep battery-alert|wc -l)
# if [ $btrAlert != "1" ]; then
#     date +"%Y-%m-%d %H:%M:%S starting battery alert"
#     screen -dmS battery-alert bash -c "$HOME/Projects/go-snippets/battery-alert/battery-alert -log-path $HOME/.logs/battery-alert.log"
# else
#     date +"%Y-%m-%d %H:%M:%S battery alert already running"
# fi

# firedock

$HOME/scripts/sshfs_mac.sh home@192.168.2.50
# $HOME/scripts/refresh_corner.sh
# $HOME/scripts/watch-rpi.sh

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on
# export PATH=$PATH:$HOME/Android/Sdk/emulator
# export DISPLAY=":0.0"
# date +"%Y-%m-%d %H:%M:%S $(xhost +)"
eval "$(rbenv init - zsh)"