#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${2}"
export AURDEST="$(pwd)/aur"

# Variables declaration.
declare -r pkgrepo="${1#*/}"
declare -r pkg="$3"

# Build outdated packages.
trap_exit() {
    if [[ ! -o xtrace ]]; then
        rm -rf "$tmp"
    fi
}

aurbuild_args+=(-d "$pkgrepo" -r repo)
#signing
#aurbuild_args+=(-s)
aurbuild "${aurbuild_args[@]}" -- -Lcs --noconfirm

{ set +ex; } 2>/dev/null
