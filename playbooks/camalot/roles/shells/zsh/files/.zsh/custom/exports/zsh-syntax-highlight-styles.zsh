#!/usr/bin/env zsh
# shellcheck disable=SC1071

# zsh-syntax-highlighting styles
# Declare as associative array before zsh-syntax-highlighting plugin loads
# to avoid "bad subscript for direct array assignment" errors.
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES+=(
  [command]='fg=green,bold'
  [builtin]='fg=green,bold'
  [function]='fg=green,bold'
  [alias]='fg=green,bold'
  [reserved]='word:fg=magenta,bold'
  [commandseparator]='fg=default'
  [redirection]='fg=yellow'
  [arg0]='fg=green'
  [default]='fg=default'
  [unknown-token]='fg=red,bold'
  [path]='underline'
  [path_pathseparator]='fg=default'
  [string]='fg=cyan'
  [single-quoted-argument]='fg=cyan'
  [double-quoted-argument]='fg=cyan'
  [back-quoted-argument]='fg=magenta'
  [dollar-quoted-argument]='fg=magenta'
  [dollar-double-quoted-argument]='fg=magenta'
  [comment]='fg=black,bold'
  [globbing]='fg=blue'
  [history-expansion]='fg=blue'
)
