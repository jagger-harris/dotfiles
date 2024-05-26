#   _____                              _   _____ _____ 
#  |_   _|                            | | |  _  /  ___|
#    | | ___ _ __ ___  _ __   ___  ___| |_| | | \ `--. 
#    | |/ _ \ '_ ` _ \| '_ \ / _ \/ __| __| | | |`--. \
#    | |  __/ | | | | | |_) |  __/\__ \ |_\ \_/ /\__/ /
#    \_/\___|_| |_| |_| .__/ \___||___/\__|\___/\____/ 
#                     | |                              
#                     |_|
#
# Bash config

### Return if not an interactive shell
[[ $- != *i* ]] && return

### Prompt
BRIGHT_RED="\[\033[1;31m\]"
BRIGHT_GREEN="\[\033[1;32m\]"
BRIGHT_BLUE="\[\033[1;34m\]"
BRIGHT_MAGENTA="\[\033[1;35m\]"
BRIGHT_CYAN="\[\033[1;36m\]"
BRIGHT_WHITE="\[\033[1;37m\]"
DEFAULT_COLOR="\[\033[0m\]"

parse_git_branch() {
  git branch 2>/dev/null | sed -n '/\* /s///p'
}

set_prompt() {
  local exit_status="$?"
  local git_branch=$(parse_git_branch)
  local top_left="╭╼"
  local bottom_left="╰╼"
  local bottom_prompt="${bottom_left}"
 
  PS1="${top_left}(${BRIGHT_BLUE}\u${DEFAULT_COLOR}@${BRIGHT_CYAN}\h${DEFAULT_COLOR})━[${BRIGHT_MAGENTA}\w${DEFAULT_COLOR}]\n"

  if [ -n "${git_branch}" ]; then
    bottom_prompt="${bottom_prompt}(${BRIGHT_GREEN}${git_branch}${DEFAULT_COLOR}) "
  fi 

  if [ ${exit_status} -ne 0 ]; then
    bottom_prompt="${bottom_prompt}(${BRIGHT_RED}✘${DEFAULT_COLOR}) "
  fi 

  PS1="${PS1}${bottom_prompt}$ "
  PROMPT_COMMAND="echo"
}

PROMPT_COMMAND=set_prompt

### Remove duplicate history
export HISTCONTROL=ignoreboth:erasedups

### Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

### Aliases

# safety
alias rm="rm -i --preserve-root"
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"

# custom
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias update="sudo pacman -Syu"
alias updateaur="paru -Sua"
alias vim="nvim"

# cd
alias ..="cd .."
alias ...="cd ../../"
alias .3="cd ../../../../"
alias .4="cd ../../../../../"

# ls
alias ls="exa --color=always --group-directories-first"
alias ll="exa -la --color=always --group-directories-first"
alias l.="exa -d .* --color=always --group-directories-first"

# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# misc
alias cat="bat"
alias mount="mount | column -t"
alias df="df -h" # human readable sizes
alias free="free -m" # shows megabytes
