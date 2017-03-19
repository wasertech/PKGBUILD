#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="Admin Localnet"
export AURDEST="$(pwd)/src"

# Variables declaration.
declare -a pkglist=()

# Load packages list.
mapfile pkglist < "pkglist"

# Remove packages from repository.
cd "bin"
while read pkg; do
  repo-remove "aurci.db.tar.gz" ${pkg}
done < <(comm -23 <(pacman -Sl "aurci" | cut -d" " -f2 | sort) <(aurchain ${pkglist[@]} | sort))
cd ".."

# Build outdated packages.
aursync --repo "aurci" --root "bin" -nr ${pkglist[@]}

{ set +ex; } 2>/dev/null
