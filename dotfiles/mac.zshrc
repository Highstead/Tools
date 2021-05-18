LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"

plugins=(git)
source $ZSH/oh-my-zsh.sh

setopt no_share_history

# POWERLEVEL9k Settings
POWERLEVEL9K_SHORTEN_STRATEGY=None
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Powerlevel Home Directory
POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_FOREGROUND='249'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='249'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='249'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=4


# Configuracion POWERLVEL9K
# POWERLEVEL9K_MODE='awesome-patched'

# Powerlevel git
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='119'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='214'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='196'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236'

# Powerlevel Ram
POWERLEVEL9K_RAM_BACKGROUND="black"
POWERLEVEL9K_RAM_FOREGROUND="249"
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\r\n"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{black}%F{white} %T %f%k%F{white}%f "
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{black} %T %f%k%F{white}%f "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status vcs virtualenv dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# export SPARK_HOME=$HOME/tools/spark
export PYTHONPATH=/usr/local/bin/python

export WORKON_HOME=~/.virtualenvs
# source $(brew --prefix)/bin/virtualenvwrapper.sh

# source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export VISUAL=nvim
# export EDITOR=$VISUAL
export KUBE_EDITOR=$VISUAL
export GIT_EDITOR=$VISUAL
# export GOROOT=$HOME/.dev/go/1.15.3
# export GOBIN=$GOPATH/bin
# export GOROOT=/usr/local/opt/go/libexec
# export GOPATH=~/

export GOPATH=$HOME
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export PATH=$PATH:~/bin
# export PATH=$PATH:$SPARK_HOME/bin
export PATH=$PATH:$GOROOT
export PATH=$PATH:$HOME/cql/dsc-cassandra-3.0.7/bin
export PATH=$PATH:$HOME/tools/maven/bin

export CLASSPATH=$JAVA_HOME/jre/lib/*.jar:/Library/Java/Extensions

export DOTFILES=~/projects/Tools/dotfiles
export GPG_TTY=$(tty)

gocd () { cd `go list -f '{{.Dir}}' $1` }

### LS Colours
alias cqlsh="cqlsh --cqlversion 3.4.0"
alias docker-clean='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'
alias docker-stop='docker ps | grep "^[0-9a-f]" | cut -d " " -f1 | xargs docker stop'
alias gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(color: white)%(committerdate:short) %(color: blue)%(refname:short)'"
alias gl='git log --date=short --pretty=format:'\''%Cgreen%h %Cblue%cd %Cred%an%Creset: %s'\'
alias gg='go get -u $1 && go install $1'
alias git-branch="git for-each-ref --sort=committerdate refs/heads/ --format='%(color: white)%(committerdate:short) %(color: blue)%(refname:short)'"
alias ll='ls -alG'
alias ls='ls -G'
alias maps='telnet mapscii.me'
alias mysql='mysql --protocol=tcp'
alias vim='nvim'
alias weather='curl http://wttr.in/ottawa'
alias history='history -i'

# This has to happen because some BS node library called itself YARN which conflicts with the Hadoops yarn service
alias yarn='/Users/highstead/.yarn/bin/yarn'

alias git-clean='git remote prune origin && git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

alias nolint='rm -rf .git/hooks/pre-push.d'
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh
killall gpg-agent
export GO111MODULE=on
export GOPROXY=https://proxy.golang.org
export GONOSUMDB="github.com/Shopify/*"
export GOPRIVATE="github.com/Shopify/*"

# export GOPROXY=https://goproxy.io - backup

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}$HOME/.kube/config:$HOME/.kube/config.shopify.cloudplatform

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias cbd="cbt -project=shopify-canada -instance=reportify-na-ne-production"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*\\vendor\\**

if [ -e /Users/highstead/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/highstead/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
for file in /Users/highstead/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
kubectl-short-aliases
