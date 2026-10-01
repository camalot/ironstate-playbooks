#!/usr/bin/env fish
# shellcheck disable=SC1071

alias ~='cd ~'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .2='cd -2'
alias .3='cd -3'
alias .4='cd -4'
alias .5='cd -5'
alias .6='cd -6'
alias .7='cd -7'
alias .8='cd -8'
alias .9='cd -9'

# Detect which `ls` flavor is in use
if ls --color >/dev/null 2>&1
  set colorflag "--color"
  alias s_lsnc="command ls --color=never"
else
  set colorflag "-G"
  alias s_lsnc="command ls"
end

# List all files colorized in long format
alias l="ls -lFh $colorflag"
alias ll="ls -lFAh $colorflag"
alias la="ls -laFh $colorflag"
alias lsd="ls -lFh $colorflag | grep --color=never '^d'"
alias ls="command ls -h $colorflag"

# Enable aliases to be sudoed
alias sudo='sudo '

alias du="du -h"
alias df="df -h"

alias epoch='date +"%s"'
alias mkdir="mkdir -pv"
alias wget="wget -c"

# IP addresses
alias whatsmyip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ifconfigme="curl -s ifconfig.me"
alias ips="ip addr show | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Canonical hex dump; some systems have this symlinked
command -v hd >/dev/null; or alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum >/dev/null; or alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum >/dev/null; or alias sha1sum="shasum"

command -v sha256sum >/dev/null; or alias sha256sum="shasum -a 256"

command -v bat >/dev/null; and alias cat='bat --paging=never'
command -v btop >/dev/null; and alias top='btop'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Docker
if command -v docker >/dev/null
  alias d='docker'
  alias dc='docker compose'
  alias dps='docker ps'
end

# Git
alias gs='git status'
alias gp='git pull'
alias gpu='git push'
alias gd='git diff'
alias gc='git commit'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate -20'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

command -v xclip >/dev/null; and alias copy="xclip"
command -v xclip >/dev/null; and alias paste="xclip -o"

command -v thefuck >/dev/null; and eval (thefuck --alias 2>/dev/null)
command -v thefuck >/dev/null; and alias shit="fuck"

alias version="fish --version"

command -v ip >/dev/null; and alias ip="ip --color"
command -v ip >/dev/null; and alias ips="ips --color address show"
