# .bashrc

export LANG="en_US.UTF-8"
export EDITOR="vim"
export VISUAL="vim"
PS1="\[\033[01;34m\]\w\[\033[00m\]\$ "

HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL="ignoreboth"
shopt -s histappend

alias ls='ls --color=auto'
alias ll='ls -alh'
alias rm3='rm -rf -- "$HOME/.cache" "$HOME/.viminfo"'
alias m='tmux'

[ -f /etc/bash_completion ] && . /etc/bash_completion
command -v fzf >/dev/null 2>&1 && eval "$(fzf --bash)"

if [[ $- == *i* && -z "${TMUX:-}" && "${TERM:-}" != "linux" ]] && command -v tmux >/dev/null 2>&1; then
    tmux
fi
