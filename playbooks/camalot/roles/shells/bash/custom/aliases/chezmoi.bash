#!/usr/bin/env bash
# chezmoi aliases

if command -v chezmoi >/dev/null 2>&1; then
  alias cm='chezmoi'
  alias cm+='chezmoi add'
  alias cma='chezmoi add'
  alias cm~='chezmoi apply'
  alias cmu='chezmoi add . && chezmoi apply'
  alias cmp='chezmoi git push'
  alias cmc='chezmoi git commit'
  alias cmg='chezmoi git'
fi
