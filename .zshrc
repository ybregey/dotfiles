#  load and unload environment variables depending on the current directory
eval "$(direnv hook zsh)"

setopt ignore_eof

# fix ^M on return key press
stty sane

# export PATH=$HOME/bin:/usr/bin:/usr/local/bin:$PATH
# TEMPFIX PATH gets messy after each source ~/.zshrc
export PATH=~/.asdf/shims:~/.asdf/bin:~/bin:/usr/bin:/usr/local/bin:~/.cargo/bin:~/.local/bin:/usr/local/sbin:/usr/sbin:/sbin:/bin:/snap/bin:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:~/.fzf/bin

export MAILCHECK=0
export ZSH_HIGHLIGHT_MAXLENGTH=30
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(history match_prev_cmd)
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_THEME="kaoss"
export BAT_THEME="TwoDark"
export CASE_SENSITIVE="true"
export DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
z
sudo
dotenv
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
