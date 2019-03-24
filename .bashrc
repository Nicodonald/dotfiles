# .bashrc
export EDITOR="vim"
TERM=xterm-256color
#set -o vi

#Custom prompt fallback if no powerline
# Settings:
BGP_BRANCH_SAFE=("develop" "dev")
BGP_BRANCH_UNSAFE=("master")
BGP_USER_UNSAFE=("root" "prod" "git")

function in_array() {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

function bgp_prompt() {

  # Define colors
  local RED="\[\e[31m\]"
  local YELLOW="\[\e[33m\]"
  local GREEN="\[\e[32m\]"
  local RESET="\[$(tput sgr0)\]"

  # Get username and host
  local USER=$(whoami)
  local USER_PS="$GREEN\u@\h$RESET"
  if in_array "${USER}" "${BGP_USER_UNSAFE[@]}"; then
    USER_PS="$RED\u@\h$RESET"
  fi

  # Get git status
  local GIT_STATUS=$(git status --porcelain --ignore-submodules 2> /dev/null | wc -l)
  local GIT_STATUS_PS="$GREEN=$RESET"
  if [[ "0" != "$GIT_STATUS" ]]; then
    GIT_STATUS_PS="$RED~$GIT_STATUS$RESET"
  fi

  # Get git branch
  local GIT_BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  local GIT_BRANCH_PS=" $YELLOW($GIT_BRANCH)$RESET$GIT_STATUS_PS"
  if in_array "${GIT_BRANCH}" "${BGP_BRANCH_SAFE[@]}"; then
    GIT_BRANCH_PS=" $GREEN($GIT_BRANCH)$RESET$GIT_STATUS_PS"
  elif in_array "${GIT_BRANCH}" "${BGP_BRANCH_UNSAFE[@]}"; then
    GIT_BRANCH_PS=" $RED($GIT_BRANCH)$RESET$GIT_STATUS_PS"
  elif [[ "" == "$GIT_BRANCH" ]]; then
    GIT_BRANCH_PS=""
  fi

  PS1="${USER_PS} ${YELLOW}\w${RESET}${GIT_BRANCH_PS} \\$ "

}

for i in ~/completion/*; do
	. $i
done

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# custom functions
if [ -f $HOME/.bash/functions ]; then
	. $HOME/.bash/functions
fi

# custom functions
if [ -f $HOME/.bash/aliases ]; then
	. $HOME/.bash/aliases
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

export PATH=$PATH":$HOME/bin/:$HOME/.local/bin"

if [[ $(python --version 2>&1) =~ 2\.7 ]]
    then
		 if [ -f ~/.local/bin/powerline-daemon ]; then 
		 powerline-daemon -q
		 POWERLINE_BASH_CONTINUATION=1
		 POWERLINE_BASH_SELECT=1
		 # repos cloné à l'installation
		 if [ -f ~/repos/powerline/powerline/bindings/bash/powerline.sh ]; then  
			 source ~/repos/powerline/powerline/bindings/bash/powerline.sh
	 fi  
fi
       #echo "I have 2.7"
    else
        echo "Python less than 2.7, powerline requirements not met"
		PROMPT_COMMAND=bgp_prompt
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

#config XDEBUG
export XDEBUG_CONFIG="idekey=vimsession"
# }}}
