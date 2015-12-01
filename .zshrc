TERM=xterm-256color
source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

alias vi=vim
alias sudo="sudo "

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle systemd
antigen bundle colored-man
antigen bundle colorize
antigen bundle compleat
antigen bundle cp
antigen bundle vundle


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
POWERLINE_NO_SHELL_ABOVE=1
. /usr/share/zsh/site-contrib/powerline.zsh
# If not running interactively, do not do anything
 [[ $- != *i* ]] && return
 [[ -z "$TMUX" ]] && exec tmux
