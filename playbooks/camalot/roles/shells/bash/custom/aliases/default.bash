#!/usr/bin/env bash
# shellcheck disable=SC1071,SC2139

alias ~='builtin cd ~ >/dev/null'
alias .='pwd'
alias ..='builtin cd .. >/dev/null'
alias ...='builtin cd ../.. >/dev/null'
alias ....='builtin cd ../../.. >/dev/null'
alias .....='builtin cd ../../../.. >/dev/null'
alias ......='builtin cd ../../../../.. >/dev/null'

if command -v eza >/dev/null 2>&1; then
  alias l="eza -lah --color=auto --icons=auto"
  alias ll="eza -lAh --color=auto --icons=auto"
  alias la="eza -lah --color=auto --icons=auto"
  alias lsd="eza -ah --only-dirs --icons=auto --classify=auto"
  alias lld="eza -lah --only-dirs --icons=auto --classify=auto"
  function ls() {
    eza -ah --color=auto --directories-first --icons=auto "$@"
  }
else
  # Detect which `ls` flavor is in use
  if ls --color >/dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
    alias s_lsnc="command ls --color=never"
  else # macOS `ls`
    colorflag="-G"
    alias s_lsnc="command ls"
  fi
  # shellcheck disable=SC2139
  alias l="ls -lFh ${colorflag}"
  # shellcheck disable=SC2139
  alias ll="ls -lFAh ${colorflag}"
  # shellcheck disable=SC2139
  alias la="ls -laFh ${colorflag}"
  # shellcheck disable=SC2139
  alias lsd="ls -lFh ${colorflag} | grep --color=never '^d'"
  # shellcheck disable=SC2139
  alias ls="command ls -h ${colorflag}"
fi

# Misc
alias sudo='sudo '
alias du="du -h"
alias df="df -h"
alias epoch='date +"%s"'
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias map="xargs -n1"

# IP addresses
alias whatsmyip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ifconfigme="curl -s ifconfig.me"

# Cross-platform fallbacks
command -v hd        > /dev/null || alias hd="hexdump -C"
command -v md5sum    > /dev/null || alias md5sum="md5"
command -v sha1sum   > /dev/null || alias sha1sum="shasum"
command -v sha256sum > /dev/null || alias sha256sum="shasum -a 256"

command -v bat  > /dev/null && alias cat='bat --paging=never'
command -v btop > /dev/null && alias top='btop'

# Docker
if command -v docker > /dev/null; then
  alias d='docker'
  alias dc='docker compose'
  alias dps='docker ps'
fi

# Git
alias gs='git status'
alias gp='git pull'
alias gpu='git push'
alias gd='git diff'
alias gc='git commit'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate -20'

# xclip
command -v xclip > /dev/null && alias copy="xclip"
command -v xclip > /dev/null && alias paste="xclip -o"

# thefuck
command -v thefuck > /dev/null && eval "$(thefuck --alias 2>/dev/null)"
command -v thefuck > /dev/null && alias shit="fuck"

alias version="bash --version | head -n1"

# find other files in

command -v ip >/dev/null && alias ip="ip --color"
command -v ip >/dev/null && alias ips="ip address show"
