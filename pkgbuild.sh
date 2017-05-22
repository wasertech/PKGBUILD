#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${2}"
export AURDEST="$(pwd)/src"
export VSCODE_NONFREE=1

# Variables declaration.
declare -a pkglist=()
declare -a pkgkey=()

# Load files.
mapfile pkglist < "pkglist"
mapfile pkgkeys < "pkgkeys"

# Remove packages from repository.
cd "bin"
while read pkg; do
  repo-remove "aurci.db.tar.gz" ${pkg}
done < <(comm -23 <(pacman -Sl "aurci" | cut -d" " -f2 | sort) <(aurchain ${pkglist[@]} | sort))
cd ".."

# Get package gpg keys.
for key in ${pkgkeys[@]}; do
  gpg --recv-keys --keyserver hkp://pgp.mit.edu ${key}
done

# Build outdated packages.
aursync --repo "aurci" --root "bin" -nr ${pkglist[@]}

{ set +ex; } 2>/dev/null
