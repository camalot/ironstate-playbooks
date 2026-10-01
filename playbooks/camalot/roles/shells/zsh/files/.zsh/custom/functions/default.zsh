#!/usr/bin/env zsh
# shellcheck disable=SC1071

function versions() {
  command -v zsh >/dev/null && zsh --version;
  command -v git >/dev/null && git --version;
  command -v python >/dev/null && python --version;
  command -v pip >/dev/null && pip --version;
  command -v go >/dev/null && go version;
  command -v terraform >/dev/null && terraform --version;
  command -v helm >/dev/null && echo "helm version: $(helm version)";
  command -v kubectl >/dev/null && echo "kubectl version: $(kubectl version)";
  command -v argocd >/dev/null && argocd version;
  command -v docker >/dev/null && docker --version;
  command -v yq >/dev/null && yq --version;
  command -v jq >/dev/null && jq --version;
  command -v ansible >/dev/null && ansible --version;
}

function reload() {
  source "$HOME/.zshrc"
}

gi() {
    if (( $# == 0 )); then
        echo "Error: Please specify at least one technology." >&2
        return 1
    fi

    # Instantly join array elements with commas
    local args="${(j:,:)@}"

    curl -L -s "https://www.gitignore.io/api/${args}"
}
