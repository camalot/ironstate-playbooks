#!/usr/bin/env bash
# shellcheck disable=SC1071

versions() {
  command -v bash      >/dev/null && bash --version | head -n1
  command -v git       >/dev/null && git --version
  command -v python    >/dev/null && python --version
  command -v pip       >/dev/null && pip --version
  command -v go        >/dev/null && go version
  command -v terraform >/dev/null && terraform --version | head -n1
  command -v helm      >/dev/null && echo "helm version: $(helm version --short 2>/dev/null)"
  command -v kubectl   >/dev/null && echo "kubectl version: $(kubectl version --client --short 2>/dev/null)"
  command -v argocd    >/dev/null && argocd version --client 2>/dev/null | head -n1
  command -v docker    >/dev/null && docker --version
  command -v yq        >/dev/null && yq --version
  command -v jq        >/dev/null && jq --version
  command -v ansible   >/dev/null && ansible --version | head -n1
}

function gi() {
    if [[ $# -eq 0 ]]; then
        echo "Error: Please specify at least one technology (e.g., gi node,python)" >&2
        return 1
    fi

    # Join arguments with commas natively in Bash
    local IFS=','
    local args="$*"

    curl -L -s "https://www.gitignore.io/api/${args}"
}

