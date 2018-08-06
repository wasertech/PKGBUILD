#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${2}"
export AURDEST="$(pwd)/aur"

# Variables declaration.
declare -r pkgrepo="${1#*/}"
declare -a pkglist=()

# Remove comments or blank lines.
for pkgfile in "bin/pkglist"; do
  sed -i -e "/\s*#.*/s/\s*#.*//" -e "/^\s*$/d" $pkgfile
done

# Load files.
mapfile pkglist < "bin/pkglist"

# Remove packages from repository.
cd "repo"
while read pkgpackage; do
  repo-remove "${pkgrepo}.db.tar.gz" $pkgpackage
done < <(comm -23 <(pacman -Sl $pkgrepo | cut -d" " -f2 | sort) <(aurchain ${pkglist[@]} | sort))
cd ".."

# Build outdated packages.
aursync --repo $pkgrepo --root "repo" -nr ${pkglist[@]}

{ set +ex; } 2>/dev/null
