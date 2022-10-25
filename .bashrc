# skip if not interactive
case $- in
*i*) ;;
*) return ;;
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
function __bash_prompt {
  local yellow="\[$(tput setaf 11)\]"
  local green="\[$(tput setaf 10)\]"
  local magenta="\[$(tput setaf 13)\]"
  local white="\[$(tput setaf 15)\]"
  local color_reset="\[$(tput sgr0)\]"
  local user='`[ ! -z "${GITHUB_USER}" ] && echo -n "@${GITHUB_USER}" || echo -n "\u@\h"`'
  local gitbranch='`\
    if [ "$(git config --get codespaces-theme.hide-status 2>/dev/null)" != 1 ]; then \
      export BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null); \
      if [ "${BRANCH}" != "" ]; then \
        echo -n " (${BRANCH}" \
        && if git ls-files --error-unmatch -m --directory --no-empty-directory -o --exclude-standard ":/*" > /dev/null 2>&1; then \
                echo -n "*"; \
        fi \
        && echo -n ")"; \
      fi; \
    fi`'
  PS1="${green}${user}:${magenta}\w${yellow}${gitbranch}${color_reset}\$ "
  unset -f __bash_prompt
}
__bash_prompt

# profiles (aliases, completion etc.)
declare -a profiles=(
  ~/.bash_aliases
  /etc/bash_completion.d/git
  /usr/share/bash-completion/completions/git
)
for profile in "${profiles[@]}"; do
  if [ -f $profile ]; then
    . $profile
  fi
done
