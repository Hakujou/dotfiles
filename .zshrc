# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
[ -d ~/.oh-my-zsh/custom/themes/powerlevel9k ] && ZSH_THEME="powerlevel9k/powerlevel9k"
[ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] && ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
unsetopt AUTO_CD

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

# Personal scripts
export PATH=/usr/local/sbin:$PATH:~/.scripts/
[ -d ~/Library/Python/3.7/bin ] && export PATH=$PATH:~/Library/Python/3.7/bin
[ -d ~/Library/Python/3.8/bin ] && export PATH=$PATH:~/Library/Python/3.8/bin
[ -d ~/Library/Python/3.9/bin ] && export PATH=$PATH:~/Library/Python/3.9/bin

# Powerlevel10k style
POWERLEVEL9K_MODE=nerdfont-complete

# Aliases
alias unzip='7z x'
dock() {
	source ~/.scripts/remote-docker "$@"
}

# Environments
def() {
    [ ! -z $VIRTUAL_ENV ] && deactivate
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_swarm context dir vcs)
    unset POWERLEVEL9K_CUSTOM_ENV
    unset POWERLEVEL9K_CUSTOM_ENV_FOREGROUND
    unset POWERLEVEL9K_CUSTOM_ENV_BACKGROUND
	export POWERLEVEL9K_CONTEXT_FOREGROUND=white
	export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon custom_env aws dir vcs)
	export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_swarm terraform virtualenv)
	export POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|amz|s3cmd|terraform|packer'
	export POWERLEVEL9K_CUSTOM_ENV_FOREGROUND="white"
	export POWERLEVEL9K_CUSTOM_ENV_CONTENT_EXPANSION='%f%B${P9K_CONTENT}'
    export POWERLEVEL9K_CUSTOM_ENV_BACKGROUND="darkred"
	export POWERLEVEL9K_OS_ICON_FOREGROUND=black
	export POWERLEVEL9K_OS_ICON_BACKGROUND=white
}
work() {
	amz euw2
	. ~/Outscale/venv/bin/activate
	export POWERLEVEL9K_CUSTOM_ENV="echo WORK"
	unset POWERLEVEL9K_AWS_SHOW_ON_COMMAND
	export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(${POWERLEVEL9K_LEFT_PROMPT_ELEMENTS[@]/os_icon})
	cd ~/Outscale
}
torque() {
	amz euw2
	. ~/Python/venv37/bin/activate
	export POWERLEVEL9K_CUSTOM_ENV="echo TORQUE"
	unset POWERLEVEL9K_AWS_SHOW_ON_COMMAND
	export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(${POWERLEVEL9K_LEFT_PROMPT_ELEMENTS[@]/os_icon})
	cd ~/Torque
}
anigme() {
	def
	amz anigme
	export POWERLEVEL9K_CUSTOM_ENV="echo ANIGME"
	unset POWERLEVEL9K_AWS_SHOW_ON_COMMAND
	export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(${POWERLEVEL9K_LEFT_PROMPT_ELEMENTS[@]/os_icon})
	cd ~/Anigme
}

# Aliases
amz() {
	export AWS_DEFAULT_PROFILE=$1
	export OUTSCALE_REGION=$(aws configure get `echo $1`.region)
	export OUTSCALE_ACCESSKEYID=$(aws configure get `echo $1`.aws_access_key_id)
	export OUTSCALE_SECRETKEYID=$(aws configure get `echo $1`.aws_secret_access_key)
	export TF_VAR_region=$OUTSCALE_REGION
}

# iTerm Fixes
export TERM=xterm-256color

# GPG
export GPG_TTY=$(tty)

# AWS-CLI tweaks
export AWS_PAGER=""

# SSH Completion
h=()
if [[ -r ~/.ssh/config ]]; then
	h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
	h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
	zstyle ':completion:*:ssh:*' hosts $h
	zstyle ':completion:*:slogin:*' hosts $h
fi

# Tmux
if [ -z ${TMUX} ]; then
	tmux attach || tmux
fi

# Default env
def
