# Default nushell aliases.

alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias ..... = cd ../../../..
alias ...... = cd ../../../../..


alias l = ls
alias la = ls -la
alias ll = ls -l
alias lt = ls **/*

# Git
alias gs = git status
alias gp = git pull
alias gpu = git push
alias gd = git diff
alias gc = git commit
alias gco = git checkout
alias gb = git branch

# Docker
alias d = docker
alias dps = docker ps

# Chezmoi
alias cm = chezmoi
alias cma = chezmoi add
alias cmp = chezmoi git push
alias cmc = chezmoi git commit
alias cmg = chezmoi git
def cmu [] { chezmoi add .; chezmoi apply }

alias ip = ip --color
alias ips = ip --color address show
