# .bashrc

export LANG="en_US.UTF-8"
export EDITOR="vim"
export VISUAL="vim"
export GPG_TTY="$(tty)"
PS1="\[\033[01;34m\]\W\[\033[00m\]\$ "

HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL="ignoreboth"
shopt -s histappend

set -o vi
bind 'set keyseq-timeout 0'
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string \1\e[6 q\2'
bind 'set vi-cmd-mode-string \1\e[2 q\2'

alias ls='ls --color=auto'
alias ll='ls -alh'
alias rm3='rm -rf -- "$HOME/.cache" "$HOME/.viminfo"'
alias m='tmux'

[ -f /etc/bash_completion ] && . /etc/bash_completion
command -v fzf >/dev/null 2>&1 && eval "$(fzf --bash)"

if [[ $- == *i* && -z "${TMUX:-}" && "${TERM:-}" != "linux" ]] && command -v tmux >/dev/null 2>&1; then
    tmux
fi
