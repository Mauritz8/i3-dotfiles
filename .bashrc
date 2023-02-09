#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias gocode='cd ~/Documents/code'
alias c='clear'
alias l='ls --color=auto'
alias cl='c;l'

# PS1='[\u@\h \W]\$ '
PS1='\[\033[31m\]>\[\033[32m\]>\[\033[33m\]>\[\033[01;36m\] 🖿  [\w] \[\033[00m\]'

[ -f "/home/mauritz/.ghcup/env" ] && source "/home/mauritz/.ghcup/env" # ghcup-env

export PATH="$PATH:/opt/flutter/bin"
export PATH="$PATH:/opt/android-studio/bin"
