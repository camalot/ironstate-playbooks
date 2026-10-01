#!/usr/bin/env fish
# shellcheck disable=SC1071

function versions
  command -v fish >/dev/null; and fish --version
  command -v git >/dev/null; and git --version
  command -v python >/dev/null; and python --version
  command -v pip >/dev/null; and pip --version
  command -v go >/dev/null; and go version
  command -v terraform >/dev/null; and terraform --version
  command -v helm >/dev/null; and echo "helm version: $(helm version)"
  command -v kubectl >/dev/null; and echo "kubectl version: $(kubectl version)"
  command -v argocd >/dev/null; and argocd version
  command -v docker >/dev/null; and docker --version
  command -v yq >/dev/null; and yq --version
  command -v jq >/dev/null; and jq --version
  command -v ansible >/dev/null; and ansible --version
end

function dev
  if test (count $argv) -eq 0
    echo "Development environment management"
    echo ""
    echo "Usage:"
    echo "  dev help     — Show this help message"
    echo "  dev cd       — Navigate to development directory"
    echo "  dev env      — Show development environment info"
    echo "  dev versions — Show development tool versions"
    return 0
  end

  switch $argv[1]
    case "cd"
      if test -d "$HOME/Development"
        cd "$HOME/Development"
      else if test -d "$HOME/dev"
        cd "$HOME/dev"
      else
        echo "Development directory not found"
        return 1
      end
    case "env"
      echo "=== Development Environment ==="
      echo "User: $(whoami)"
      echo "Home: $HOME"
      echo "Shell: $SHELL"
      echo "PWD: $PWD"
    case "versions"
      versions
    case "help" "h" "-h" "--help"
      eval "$argv[0]"
    case "*"
      echo "Unknown subcommand: $argv[1]"
      eval "$argv[0]"
      return 1
  end
end

function gi
    if test (count $argv) -eq 0
        echo "Error: Please specify at least one technology." >&2
        return 1
    fi

    # Join the arguments list with commas
    set -l args (string join "," $argv)

    curl -L -s "https://www.gitignore.io/api/$args"
end
