export ZSH=/Users/tdubey/.oh-my-zsh


ZSH_THEME="geometry/geometry"

plugins=(
  git
  osx
  zsh-syntax-highlighting
  zsh-autosuggestions
  docker
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
GEOMETRY_PROMPT_PLUGINS=(virtualenv docker_machine exec_time git)

export PATH=/Users/dubey/.local/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# (cat ~/.cache/wal/sequences &)

export GOPATH=$HOME/clearstreet/fleet # don't forget to change your path correctly!
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

fortune | cowsay

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
cd $HOME/clearstreet/fleet/  && source $HOME/clearstreet/fleet/.env >> /dev/null && cd - >> /dev/null
