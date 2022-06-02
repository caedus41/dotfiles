[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion



# Path to your oh-my-zsh installation.
export ZSH=/Users/cthompson/.oh-my-zsh

ZSH_THEME="robbyrussell"
export TERM="xterm-256color"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir vcs)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=20000
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/cthompson/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ----------------------------------------
# Forgit setup
# ----------------------------------------
source ~/workspace/forgit

# ----------------------------------------
# Bash-like (Thanks Mitch)
# ----------------------------------------

# Ctrl+U  -->  delete until beginning of line (not whole line)
bindkey \^U backward-kill-line

# Ctrl+K  -->  delete until end of line
bindkey \^Y kill-line

# zsh forward / backward words like bash (jump to end of word when moving forward)
autoload -U select-word-style
select-word-style bash

# Env Vars
export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/Users/cthompson/workspace/istio-1.1.7/bin"
export PATH="$PATH:/usr/local/opt/rabbitmq/sbin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/opt/homebrew/bin/:$PATH"

# Docker
export DOCKER_SCAN_SUGGEST=false

# Gcloud/Kubectl
# https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Fubectl

[ -f /usr/local/bin/fubectl.source ] && source /usr/local/bin/fubectl.source

# Helm
source <(helm completion zsh)
source <(kubectl completion zsh)

# Updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.zsh.inc'; fi

# NVM
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# ----------------------------------------
# Aliases
# ----------------------------------------

alias awls='awless list instances'
alias crontab='crontab -i'
alias dc='docker-compose'
alias didt='tail -n 10 ~/.did.txt'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ksh='kex /bin/bash'
alias ks='ls' # We all make mistakes
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
alias pretty_branch='for k in `git branch | perl -pe "s/^..//"`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'
alias tags='git for-each-ref --format="%(taggerdate): %(refname)" --sort=-taggerdate --count=10 refs/tags'
alias cl='clear'
alias g='git'
alias Grep='grep'
#alias grin='grep -rIin'
alias i='infractl'
alias infra='cd /Users/cthompson/workspace/infractl/'
alias k='kubectl'
alias kseb='kubectl110 --context=dev-seb'
alias ksfo='kubectl110 --context=prod-sfo'
alias pretty='python -m json.tool'
alias show='knife node show'
alias t='task'
alias tf='terraform'
alias tfdocs='terraform-docs markdown table ./'
alias tns='tmux new -s'
alias tls='tmux ls'
alias tas='tmux attach -t'
alias tks='tmux kill-session -t'
alias v='workon'
alias vd='deactivate'
alias vm='mkvirtualenv --python=/usr/local/bin/python3.8'
alias vr='rmvirtualenv'
#alias ws='cd ~/workspace'

ff() {
    find ./ -name "*$1*"
}

awssh() {
    awless ssh --private "$1"
}

awscp() {
    scp -i ~/.ssh/cthompson-key.pem "$1" "$2"
}

# fv - fuzzy open with vim from anywhere
 # ex: vf word1 word2 ... (even part of a file name)
 # zsh autoload function
fv() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

grin() {
    if [[ -z $2 ]]; then
        DIR="./"
    else
        DIR=$2
    fi
    grep -rIin $1 $DIR
}

ish() { # Let's you ssh to aws instance ids, should auto-discover keys with awless
    # Old version, still useful
    # ssh `aws ec2 describe-instances --instance-ids "$1" | jq -r '.Reservations[].Instances[].PrivateIpAddress'`
    awless ssh $1 --private
}

nsh() {
    ish `awls --tag Name=$1 --ids|head -n1`
}

did() {
    echo "`date` $*" >> ~/.did.txt
}

bd() {
    echo $1 | base64 -D
}

ws() {
    if [[ -z $1 ]]; then
        dir=$(find ~/workspace -type d -maxdepth 2 | grep -v '\.git' | fzf --multi --ansi -i -1 --height=50% --header-lines=1 --inline-info --border | awk '{ print $1 }')
        test -z $dir && cd ~/workspace || cd $dir
    else
        cd ~/workspace/$*
    fi
}

__fzf_history__() (
  local line
  shopt -u nocaseglob nocasematch
  line=$(
    HISTTIMEFORMAT= builtin history |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac --sync -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m" $(__fzfcmd) |
    command grep '^ *[0-9]') &&
    if [[ $- =~ H ]]; then
      sed 's/^ *\([0-9]*\)\** .*/!\1/' <<< "$line"
    else
      sed 's/^ *\([0-9]*\)\** *//' <<< "$line"
    fi
)

eval "$(starship init zsh)"
