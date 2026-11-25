# History: shared across sessions like zsh's SHARE_HISTORY.
HISTFILE=~/.bash_history
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Prompt: green user@host, blue path, green git branch.
# git branch is computed in the prompt function below.
# Vi editing mode.
set -o vi

# Completion (bash-completion package) and direnv/pyenv/zellij hooks.
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

if type direnv > /dev/null 2>&1; then
    eval "$(direnv hook bash)"
fi

if type zellij > /dev/null 2>&1; then
    eval "$(zellij setup --generate-completion bash)"
fi

if [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    # Explicit shell: $SHELL says zsh when this file runs in bash
    eval "$(pyenv init - bash)"
fi

# Aliases shared with zshrc, kept next to it in the repo.
source "$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")/aliases"

# Prompt function: runs before each prompt is drawn.
# history -c/-r picks up lines other sessions appended, so all open
# shells mirror each other like SHARE_HISTORY.
__set_prompt() {
    local branch
    branch=$(git symbolic-ref -q --short HEAD 2>/dev/null \
        || git describe --tags --exact-match 2>/dev/null \
        || git rev-parse --short HEAD 2>/dev/null)

    PS1='\[\e[32m\]\u@\h\[\e[0m\] \[\e[34m\]\w\[\e[0m\]'
    if [[ -n $branch ]]; then
        PS1+=' (\[\e[32m\]'"$branch"'\[\e[0m\])'
    fi
    PS1+='\$ '
}
PROMPT_COMMAND=__set_prompt
