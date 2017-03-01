# Path to your oh-my-zsh installation.
#export TERM=screen-256color
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="simple"
#ZSH_TMUX_AUTOSTART=true
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmux scala sbt npm node mvn jsontools git-hubflow encode64)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="${PATH}:/opt/tools/copy/x86:/opt/tools/SoapUI/bin:/opt/tools/vim/bin:/opt/tools/git/bin:/opt/tools/screen/bin:/usr/local/bin:/bin:/bin:/bin::/usr/sbin:/bin:/Users/marcinbe/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/bin:::/bin:/bin:/Users/marcinbe/repo/mbedna/bin:/opt/tools/acrobat/Adobe/Reader9/bin:/opt/tools/edeklaracje/e-Deklaracje/bin"

#export PATH="${PATH}:/opt/boxen/nodenv/versions/v0.10.26/lib/node_modules/jshint/bin"
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
if [ -f "${HOME}/.bashrc" ]; then
  source "${HOME}/.bashrc"
fi
bindkey -v
bindkey "^R" history-incremental-search-backward

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
HOST_NAME_PROMPT='%F{blue}${${(%):-%m}#}%f %# '
export PROMPT=$PROMPT$HOST_NAME_PROMPT
