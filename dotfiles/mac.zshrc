LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

export ZSH=/Users/michaelhighstead/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"

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
source $(brew --prefix)/bin/virtualenvwrapper.sh

# source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export VISUAL=nvim
export EDITOR=$VISUAL
export GIT_EDITOR=$VISUAL
export GOPATH=~/projects/goprojects
export GOROOT=/Users/michaelhighstead/.dev/go/1.7.1
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$SCALA_HOME/bin
# export PATH=$PATH:$SPARK_HOME/bin
export PATH=$PATH:$GOROOT
export PATH=$PATH:/Users/michaelhighstead/cql/dsc-cassandra-3.0.7/bin
export PATH=$PATH:/Users/michaelhighstead/tools/maven/bin

gocd () { cd `go list -f '{{.Dir}}' $1` }

### LS Colours
alias ls='ls -G'
alias ll='ls -alG'
alias cqlsh="cqlsh --cqlversion 3.4.0"
alias vim='nvim'
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
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
