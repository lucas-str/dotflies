###############################################################################
# Oh My Zsh
###############################################################################

## Path to your oh-my-zsh installation.
#  export ZSH="/home/lucas/.oh-my-zsh"
#
## Set name of the theme to load. Optionally, if you set this to "random"
## it'll load a random theme each time that oh-my-zsh is loaded.
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="alanpeabody"
#
## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
#plugins=(
#  git
#)
#
#source $ZSH/oh-my-zsh.sh

###############################################################################
# My Minimal Zsh
###############################################################################

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# Vim style
bindkey -v
bindkey "^?" backward-delete-char

# Completion
autoload -Uz compinit
compinit
# Complete aliases
#setopt COMPLETE_ALIASES
# Complete sudo
zstyle ':completion::complete:*' gain-privileges 1
# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# Arrow history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -- "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey -- "${terminfo[kcud1]}" down-line-or-beginning-search

# Prompt
local user='%F{magenta}%n@%m%f'
local pwd='%F{blue}%~%f'
PROMPT="${user} ${pwd}$ "

###############################################################################
# Exports and aliases
###############################################################################

export PATH=$HOME/bin:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

alias ls="ls --color=auto"
alias ll="ls -lArth"

alias tmux="tmux -2"

export PATH="${PATH}:${HOME}/.local/bin/"
