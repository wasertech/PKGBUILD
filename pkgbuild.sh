#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${2}"

# Variables declaration.
declare -r pkgrepo="${1#*/}"

# Build package (add -s to first options for signing)
aurbuild -d "$pkgrepo" -r repo -- -Lcs --noconfirm

{ set +ex; } 2>/dev/null
