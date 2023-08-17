LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

#powerlevel stuff

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


### End plvl10k
export PYTHONPATH=/usr/local/bin/python

export WORKON_HOME=~/.virtualenvs
# source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export VISUAL=nvim
# export EDITOR=$VISUAL
export KUBE_EDITOR=$VISUAL
export GIT_EDITOR=$VISUAL

export GOPATH=$HOME
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export PATH=$PATH:~/bin
# export PATH=$PATH:$SPARK_HOME/bin
export PATH=$PATH:$GOROOT
export PATH=$PATH:$HOME/.cargo/bin
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
# export GONOSUMDB="github.com/highstead/*"
# export GOPRIVATE="github.com/highstead/*"

# export GOPROXY=https://goproxy.io - backup

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}$HOME/.kube/config:$HOME/.kube/config.shopify.cloudplatform

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias cbd="cbt -project=shopify-canada -instance=reportify-na-ne-production"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


eval "$(/opt/homebrew/bin/brew shellenv)"

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*\\vendor\\**

