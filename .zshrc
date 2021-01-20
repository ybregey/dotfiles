export DISABLE_AUTO_UPDATE=true
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

# PATH config
export PATH=~/.fzf/bin:~/.asdf/shims:~/.asdf/bin:/bin:/usr/bin:/usr/local/bin:/snap/bin:~/.local/bin:/sbin:/usr/sbin:/usr/local/sbin:~/.cargo/bin
fpath=(/usr/local/share/zsh-completions $fpath) # functions definition path
java!() {
  export PATH=$PATH:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin
}

# emulate bash PROMPT_COMMAND
precmd() { eval "$PROMPT_COMMAND" }
# open new terminal in same dir
PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
[[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"

# keyboard fixes
setopt ignore_eof # wtf?
stty sane # fix ^M on return key press
alias sane="stty sane"

plugins=(
z # jump to directories
dotenv
git
rails
zsh-autosuggestions
zsh-syntax-highlighting
)

# Oh my zsh!
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

alias zsh!="source ~/.zshrc"
alias czsh='nano $HOME/.zshrc'

source $HOME/zsh/user to .zshrc
source $HOME/zsh/git to .zshrc
source $HOME/zsh/fzf to .zshrc
#source $HOME/zsh/elixir to .zshrc
#source $HOME/zsh/python to .zshrc
source $HOME/zsh/rails to .zshrc
#source $HOME/zsh/betty to .zshrc
source $HOME/zsh/asdf to .zshrc
source $HOME/zsh/docker to .zshrc
source $HOME/zsh/network to .zshrc
source $HOME/zsh/cheatsheets to .zshrc

source $HOME/zsh/projects/overhaul
