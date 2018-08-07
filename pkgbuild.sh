#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${2}"

# Variables declaration.
declare -r pkgrepo="${1#*/}"

# Build package

#declare -a gpg_args=(--detach-sign --no-armor --verbose --batch)
source /usr/share/makepkg/util.sh
mkdir -p pkgs
PKGDEST=pkgs LC_MESSAGES=C makepkg -Lcs --noconfirm
#signing
#gpg_args+=(-u "$GPGKEY")
#for f in pkgs/*; do
#    gpg "${gpg_args[@]}" "$f"
#done
mv -v pkgs/* -t repo
LANG=C repo-add -v $(readlink -f repo/"$pkgrepo".db) pkgs/*
#gpg "${gpg_args[@]}" --output "pkgs/${db_path##*/}".sig "$db_path"
#mv -v "pkgs/${db_path##*/}".sig -t repo

{ set +ex; } 2>/dev/null
