# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mm00772/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
zstyle :compinstall filename '/Users/mm00772/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Env Vars
export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/bin/go"

## MM SPECIFIC

source /usr/local/share/zsh/site-functions
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs

export AWS_CA_BUNDLE=~/.ssh/mm-cert-bundle.pem.unix
export REQUESTS_CA_BUNDLE=~/.ssh/mm-cert-bundle.pem.unix

source /usr/local/bin/fubectl.source

# Aliases
alias awls='awless list instances'
alias crontab='crontab -i'
#alias did="vim +'normal Go' +'r!date' ~/did.txt"
alias didt='tail -n 10 ~/.did.txt'
alias gt='cat ~/.ssh/git_token | pbcopy'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ksh='kex /bin/bash'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
alias pretty_branch='for k in `git branch | perl -pe s/^..//`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'
alias tags='git for-each-ref --format="%(taggerdate): %(refname)" --sort=-taggerdate --count=10 refs/tags'
alias cl='clear'
alias g='git'
alias Grep='grep'
alias grin='grep -rIin'
alias infra='cd /Users/mm00772/workspace/aws-infra/'
alias ipython='python -m IPython'
alias k='kubectl'
alias pretty='python -m json.tool'
alias show='knife node show'
alias tf='terraform'
alias tfm='cd ~/workspace/tf-modules'
alias tfia='terraform init && terraform apply'
alias tfds='cd ~/workspace/tf-ds'
alias trf='terraform'
alias v='workon'
alias vd='deactivate'
alias vm='mkvirtualenv'
alias vr='rmvirtualenv'
alias ws='cd /Users/mm00772/workspace'

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
# src() {
#     cd ~/workspace/aws-infra && v infra && source env/$1.sh && cd -
# }
src() {
    cd ~/workspace/sre-aws-helpers/ && source me && creds $1 && cd -
}
did() {
    echo "`date` $*" >> ~/.did.txt
}

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
