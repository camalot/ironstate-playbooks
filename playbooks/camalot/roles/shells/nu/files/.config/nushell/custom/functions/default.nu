# Default nushell custom commands (functions).

def which [cmd: string] {
  ^which $cmd
}

def reload [] {
  exec nu
}

def versions [] {
  if (which git       | length) > 0 { ^git --version }
  if (which python    | length) > 0 { ^python --version }
  if (which go        | length) > 0 { ^go version }
  if (which terraform | length) > 0 { ^terraform --version | first 1 }
  if (which kubectl   | length) > 0 { ^kubectl version --client --short }
  if (which docker    | length) > 0 { ^docker --version }
  if (which yq        | length) > 0 { ^yq --version }
  if (which jq        | length) > 0 { ^jq --version }
}

def gi [...technologies: string] {
    if ($technologies | is-empty) {
        print --stderr "Error: Please specify at least one technology."
        return
    }

    # Join the string array into a single comma-separated string
    let args = ($technologies | str join ",")

    curl -L -s $"https://www.gitignore.io/api/$args"
}
