TERM=xterm-256color
# If not running interactively, do not do anything
export PATH=$PATH":/home/$USER/bin:/home/$USER/.local/bin"
if [[ -z "$TMUX" ]]; then
    tmux has-session &> /dev/null
    if [ $? -eq 1 ]; then
      exec tmux new
      exit
    else
      exec tmux attach
      exit
    fi
fi

source ~/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

alias vi=vim
alias sudo="sudo "

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle systemd
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle compleat
antigen bundle cp
antigen bundle vundle
antigen bundle yum
#
## Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting
#
## Load the theme.
##antigen theme robbyrussell
#
## Tell antigen that you're done.
antigen apply
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
POWERLINE_NO_SHELL_ABOVE=1
. ~/repos/powerline/powerline/bindings/zsh/powerline.zsh
