export EDITOR='code --wait'
export HISTCONTROL=ignoredups

# Colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Prompt
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

source ~/.bash_aliases

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tugrul/.conda/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tugrul/.conda/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tugrul/.conda/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tugrul/.conda/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [ "$(conda 2> /dev/null)" ]; then
    conda activate dev
fi
