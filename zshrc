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

# Interactive comments
set -k

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
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
# Backward search
bindkey '^R' history-incremental-search-backward

# Other key bindings
bindkey -- "${terminfo[khome]}"   beginning-of-line
bindkey -- "${terminfo[kend]}"    end-of-line
bindkey -- "${terminfo[kich1]}"   overwrite-mode
bindkey -- "${terminfo[kbs]}"     backward-delete-char
bindkey -- "${terminfo[kdch1]}"   delete-char
bindkey -- "${terminfo[kpp]}"     beginning-of-buffer-or-history
bindkey -- "${terminfo[knp]}"     end-of-buffer-or-history

# Make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Prompt
local user='%F{magenta}%n@%m%f'
local pwd='%F{blue}%~%f'
PROMPT="${user} ${pwd}$ "

# Rigth prompt
setopt PROMPT_SUBST
RPROMPT='%F{green}$(git branch --show-current 2>/dev/null)%f'

###############################################################################
# Exports and aliases
###############################################################################

export PATH="${HOME}/bin:${HOME}/.local/bin:/usr/local/go/bin:${PATH}"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

alias ls="ls --color=auto"
alias ll="ls -lArth"

alias tmux="tmux -2"
