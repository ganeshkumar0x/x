# Environment variables
export CLICOLOR=1
export LANG="en_US.UTF-8"
export PS1="\[\033[01;34m\]\W\[\033[00m\]\$ "
export EDITOR="vim"

# Shell options
set -o ignoreeof

# Aliases
alias ls="ls --color=auto"
alias ll="ls -alh"
alias 00='sudo poweroff'
alias 01='sudo reboot'
alias rm3='sudo rm -rf .cache/ .viminfo'
alias ppt2pdf='for f in *.ppt *.pptx; do [ -f "$f" ] && unoconv -f pdf "$f" >/dev/null 2>&1; done'
alias scan='nmcli device wifi rescan'
alias m='tmux'

# Bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Welcome message
echo -e "Do one thing and do it well.\nUNIX Philosophy"
