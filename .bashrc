# skip if not interactive
case $- in
    *i*) ;;
      *) return;;
esac

# editor
export EDITOR='code --wait'

# history
export HISTCONTROL=ignoredups
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# window
shopt -s checkwinsize

# less
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# prompt
COLOR_YELLOW="\033[0;93m"
COLOR_GREEN="\033[0;92m"
COLOR_MAGENTA="\033[0;95m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
function git_branch {
  local branch="$(git status 2> /dev/null | grep -oP '(?<=On branch )[^${IFS}]*' 2> /dev/null)"
  local commit="$(git log -n1 --format=format:'%h' 2> /dev/null)"
  if [[ -n $branch ]] && [[ -n $commit ]]; then echo " ($commit|$branch)"
  elif [[ -n $branch ]]; then echo " ($branch)"
  elif [[ -n $commit ]]; then echo " ($commit)"
  fi
}
PS1="\[$COLOR_WHITE\]${debian_chroot:+($debian_chroot)}\[$COLOR_GREEN\]\u@\h:\[$COLOR_MAGENTA\]\w"
PS1+="\[$COLOR_YELLOW\]\$(git_branch)"
PS1+="\[$COLOR_WHITE\]\$\[$COLOR_RESET\] "
export PS1

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
