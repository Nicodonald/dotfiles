# .bashrc
export EDITOR="vim"
TERM=xterm-256color
#set -o vi

for i in ~/completion/*; do
	. $i
done

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# custom functions
if [ -f /home/$USER/.bash/functions ]; then
	. /home/$USER/.bash/functions
fi

# custom functions
if [ -f /home/$USER/.bash/aliases ]; then
	. /home/$USER/.bash/aliases
fi

#if tmux present then launch it
if hash tmux 2>/dev/null; then  
#if not running interactively do not do anything
 if ! [[ $- != *i* ]]; then
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
 fi
fi

export PATH=$PATH":/home/$USER/bin/:/home/$USER/.local/bin"

if [ -f ~/.local/bin/powerline-daemon ]; then 
 powerline-daemon -q
 POWERLINE_BASH_CONTINUATION=1
 POWERLINE_BASH_SELECT=1
 # repos cloné à l'installation
 if [ -f ~/repos/powerline/powerline/bindings/bash/powerline.sh ]; then  
	 source ~/repos/powerline/powerline/bindings/bash/powerline.sh
 fi  
fi

#cd `cat ~/.prev_dir`
#cat /dev/null > ~/.prev_dir

eval "$(dircolors ~/.bash/.DIR_COLORS)"


# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
