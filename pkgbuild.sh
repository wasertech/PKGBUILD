#!/bin/bash

set -ex

# Export path to AUR download.
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
aursync -n --repo "aurci" --root "bin" ${pkglist[@]}

{ set +ex; } 2>/dev/null
