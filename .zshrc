setopt ignore_eof # wtf?

# fix ^M on return key press
stty sane
alias sane="stty sane"

export PATH=~/.fzf/bin:~/.asdf/shims:~/.asdf/bin:/bin:/usr/bin:/usr/local/bin:/snap/bin:~/.local/bin:/sbin:/usr/sbin:/usr/local/sbin:~/.cargo/bin

# git fuzzy
#export PATH="/home/kaoss/git-fuzzy/bin:$PATH"

java!() {
  export PATH=$PATH:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin
}

export MAILCHECK=0
export ZSH_HIGHLIGHT_MAXLENGTH=30
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(history match_prev_cmd)
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_THEME="kaoss"
export BAT_THEME="TwoDark"
export CASE_SENSITIVE=1
export DISABLE_UNTRACKED_FILES_DIRTY=1
export ZSH_DOTENV_PROMPT=0

plugins=(
z # jump to directories
sudo
dotenv
asdf
fzf-zsh
git
rails
zsh-autosuggestions
zsh-syntax-highlighting
)

# Oh my zsh!
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh


fpath=(/usr/local/share/zsh-completions $fpath)

alias zsh!="source ~/.zshrc"
ezshc(){
  nano ~/.zshrc
  source ~/.zshrc
  echo "new .zshrc sourced."
}

source $HOME/zsh/user to .zshrc
source $HOME/zsh/git to .zshrc
source $HOME/zsh/fzf to .zshrc
source $HOME/zsh/elixir to .zshrc
#source $HOME/zsh/python to .zshrc
source $HOME/zsh/rails to .zshrc
#source $HOME/zsh/betty to .zshrc
source $HOME/zsh/asdf to .zshrc
source $HOME/zsh/docker to .zshrc
source $HOME/zsh/network to .zshrc
source <(cat $HOME/zsh/projects/*)
