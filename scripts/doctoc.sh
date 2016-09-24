#!/bin/bash
# strict mode http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

function commit_changes () {
  if [[ $(git diff --shortstat 2> /dev/null | tail -n1) != '' ]]; then
    git add README.md CONTRIBUTING.md && \
    git commit --no-verify -m'table of contents update'
  fi
}

if [ -f README.md ]; then doctoc README.md; fi
if [ -f CONTRIBUTING.md ]; then doctoc CONTRIBUTING.md; fi
commit_changes
