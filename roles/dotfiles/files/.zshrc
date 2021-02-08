#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Linuxbrew
eval $(~/.linuxbrew/bin/brew shellenv)


# zsh-completion
if type brew &>/dev/null; then
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

autoload -Uz compinit
compinit
fi


# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# share .zshhistory
setopt inc_append_history
setopt share_history


# peco
function peco-repos() {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-repos
bindkey '^R' peco-repos

function peco-history-selection() {
    BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^H' peco-history-selection

if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

function peco-cdr () {
    local selected_dir="$(cdr -l | sed -E 's/^[0-9]+ +//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^F' peco-cdr
#bindkey '^D' peco-cdr

function peco-docker-images() {
  local images="$(sudo docker images | tail -n +2 | sort | peco --prompt 'DOCKER IMAGES>' | awk '{print $3}' ORS=' ')"
  [ -z "$images" ] && return
  BUFFER="$LBUFFER$images$RBUFFER"
  CURSOR=$#BUFFER
}

zle -N peco-docker-images
bindkey '^x^i' peco-docker-images


# anyenv
eval "$(anyenv init -)"


# goenv
export GOENV_ROOT=$HOME/.anyenv/envs/goenv
export PATH=$GOENV_ROOT/bin:$PATH
if command -v goenv 1>/dev/null 2>&1; then
  eval "$(goenv init -)"
fi

# tfenv
export TFENV_ROOT=$HOME/.anyenv/envs/tfenv
export PATH=$TFENV_ROOT/bin:$PATH
#exec $SHELL -l


# nvm
export NVM_NODEJS_ORG_MIRROR=http://nodejs.org/dist/
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion" -> run bashcompinit in ZSH


# IntelliJ IDEA
export PATH="$HOME/Applications/idea/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# alias
alias cici='/usr/local/bin/circleci'
