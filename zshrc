export ZSH=/Users/dubey/.oh-my-zsh

ZSH_THEME="geometry/geometry"

plugins=(
  git
  osx
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
GEOMETRY_PROMPT_PLUGINS=(virtualenv docker_machine exec_time git)

export PATH=/Users/dubey/.local/bin:$PATH

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

(cat ~/.cache/wal/sequences &)

fortune | cowsay
