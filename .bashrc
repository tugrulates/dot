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
function __bash_prompt {
  local yellow="\033[0;93m"
  local green="\033[0;92m"
  local magenta="\033[0;95m"
  local white="\033[0;37m"
  local color_reset="\033[0m"
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

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
