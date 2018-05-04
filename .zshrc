# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/sbin:$PATH
export PATH=~/.local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

source $HOME/.aliases to .zshrc
source $HOME/.dockeraliases to .zshrc

ZSH_THEME="kaoss"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git rake rails)

source $ZSH/oh-my-zsh.sh

# User configuration

# prevent terminal from closing when Ctrl+D was pressed
set -o ignoreeof

# Preferred editor for local and remote sessions
export EDITOR='vi'

# prevent terminal from closing when Ctrl+D was pressed
set -o ignoreeof

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export EDITOR="atom"

export GOPATH=$HOME/golang
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export DISABLE_SPRING=1

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

alias betty="~/betty/main.rb"
