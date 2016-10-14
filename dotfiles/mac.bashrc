
####################################
# Scala and  pyspark setup
export JAVA_HOME=$(/usr/libexec/java_home)
export SCALA_HOME=/usr/local/bin/scala
export SPARK_HOME=$HOME/tools/spark
export PYTHONPATH=/usr/local/bin/python:$SPARK_HOME/python

export WORKON_HOME=~/.virtualenvs
source $(brew --prefix)/bin/virtualenvwrapper.sh

source $(brew --prefix)/etc/bash_completion
# source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

##################################
# Prompt stuff
GREEN="$(tput setaf 2)"
BLUE="$(tput setaf 3)"
RESET="$(tput sgr0)"

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\n[\u@mbp \w${BLUE}$(__git_ps1)${RESET}]\n↳ '
export EDITOR=vim
export GOPATH=~/projects/goprojects
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$SCALA_HOME/bin
export PATH=$PATH:$SPARK_HOME/bin
export PATH=$PATH:/Users/michaelhighstead/cql/dsc-cassandra-3.0.7/bin
export PATH=$PATH:/Users/michaelhighstead/tools/maven/bin

### LS Colours
alias ls='ls -G'
alias ll='ls -alG'
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi
