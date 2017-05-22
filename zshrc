export ZSH=/Users/dubey/.oh-my-zsh

# ZSH theme and plugins
ZSH_THEME="geometry/geometry"
plugins=(git zsh-autosuggestions tmux brew history osx sublime)

# Prompt configuration
GEOMETRY_PROMPT_PLUGINS=(virtualenv docker_machine exec_time git hg jobs)
PROMPT_GEOMETRY_EXEC_TIME="true"

source $ZSH/oh-my-zsh.sh

# Syntax highlighting, startup cowsay
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fortune | cowsay

# OpenCV thing, should delete
export PATH="/usr/local/opt/opencv3/bin:$PATH"

# ITerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Start tmux on startup
if [[ -z "$TMUX" ]]
then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`"
    if [[ -z "$ID" ]]
    then
        tmux new-session
    else
        tmux attach-session -t "$ID"
    fi
fi