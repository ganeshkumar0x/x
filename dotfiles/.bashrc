# Environment variables
export CLICOLOR=1
export LANG="en_US.UTF-8"
export PS1="\[\033[01;34m\]\W\[\033[00m\]\$ "
export EDITOR="vim"
export GPG_TTY=$(tty)

# History configuration
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth

# Shell options
set -o ignoreeof
shopt -s histappend
shopt -s autocd

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alh'
alias 00='sudo poweroff'
alias 01='sudo reboot'
alias rm3='sudo rm -rf ~/.cache/ ~/.viminfo'
alias scan='nmcli device wifi rescan'
alias m='tmux'

# Bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Welcome message
echo -e "Do one thing and do it well.\nUNIX Philosophy"
