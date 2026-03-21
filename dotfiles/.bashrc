# .bashrc

# Environment
export LANG="en_US.UTF-8"
export EDITOR="vim"
export CLICOLOR=1
export GPG_TTY=$(tty)
export PS1="\[\033[01;34m\]\W\[\033[00m\]\$ "

# History
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL="ignoreboth"
shopt -s histappend

# Options
set -o vi
set -o ignoreeof
shopt -s autocd
bind 'set keyseq-timeout 0'
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string \1\e[6 q\2'
bind 'set vi-cmd-mode-string \1\e[2 q\2'

# Aliases
alias l='clear'
alias ls='ls --color=auto'
alias ll='ls -alh'
alias 00='sudo poweroff'
alias 01='sudo reboot'
alias rm3='sudo rm -rf ~/.cache/ ~/.viminfo'
alias scan='nmcli device wifi rescan'
alias m='tmux'

# Completion
[ -f /etc/bash_completion ] && . /etc/bash_completion
eval "$(fzf --bash)"

# Auto-Tmux
if [[ $- == *i* ]] && [[ -z "$TMUX" ]] && command -v tmux >/dev/null 2>&1; then
    exec tmux
fi

# Welcome
echo -e "Do one thing and do it well.\nUNIX Philosophy"
