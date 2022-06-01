## Testing
#export BYOBU_PREFIX=/usr/local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion



# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/cthompson/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
export TERM="xterm-256color"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir vcs)


# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  forgit
  zsh-autosuggestions
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
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
# Bash-like (Thanks Mitch)
# ----------------------------------------

# Ctrl+U  -->  delete until beginning of line (not whole line)
bindkey \^U backward-kill-line

# Ctrl+K  -->  delete until end of line
bindkey \^Y kill-line

# zsh forward / backward words like bash (jump to end of word when moving forward)
autoload -U select-word-style
select-word-style bash

# iterm2 stuff

source ~/.iterm2_shell_integration.zsh

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

# Virtualenvs

export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Docker
export DOCKER_SCAN_SUGGEST=false

# Fubectl

export BUILD_PROJECT="common-build"
export TEST_PROJECT="strong-keyword-184513"
export PROD_PROJECT="platform-prod-399563"
export DEV_PROJECT="platform-dev-788014"
[ -f /usr/local/bin/fubectl.source ] && source /usr/local/bin/fubectl.source
#source /path/to/kube-ps1.sh
#PROMPT='$(kube_ps1)'$PROMPT

# Helm
source <(helm completion zsh)
source <(kubectl completion zsh)

# Updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.zsh.inc'; fi

## Set up O'Reilly Specific Stuff
source ~/.oreillyrc

# NVM
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# ----------------------------------------
# Aliases
# ----------------------------------------

alias awls='awless list instances'
alias crontab='crontab -i'
#alias did="vim +'normal Go' +'r!date' ~/did.txt"
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
alias pretty_branch='for k in `git branch | perl -pe s/^..//`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'
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
alias tfia='terraform init && terraform apply'
alias tfds='cd ~/workspace/tf-ds'
alias tfdocs='terraform-docs markdown table ./'
alias trf='terraform'
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
# vf - fuzzy open with vim from anywhere
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
o22() {
    case $AWS_ENVIRONMENT in
        "nonprd")
        SG="sg-2eb93d54"
        ;;
    esac
    aws ec2 modify-instance-attribute --instance-id $1 --groups $SG
}
nsh() {
    ish `awls --tag Name=$1 --ids|head -n1`
}
did() {
    echo "`date` $*" >> ~/.did.txt
}
rsed() {
    // TODO
    // recursive sed
    find . -type f -exec sed -i.bak "s/coot-test.git/coot.git/" {} \;
}
bd() {
    echo $1 | base64 -D
}
# ws() {
    #if [[ -z $1 ]]; then
        #cd ~/workspace
    #else
        #cd ~/workspace/$*
    #fi
#}

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

source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"
