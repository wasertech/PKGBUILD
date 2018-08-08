#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${2}"

# Variables declaration.
declare -r pkgrepo="${1#*/}"

# Set up gpg options
mkdir "$HOME/.gnupg"
echo 'auto-key-retrieve:0:1' | gpgconf --change-options gpg
#echo 'keyserver:0:"hkps%3a//pgp.mit.edu"' | gpgconf --change-options dirmngr

# Build package
mkdir pkgs
PKGDEST=pkgs LC_MESSAGES=C makepkg -Lcs --noconfirm
#declare -a gpg_args=(--detach-sign --no-armor --verbose --batch)
#gpg_args+=(-u "$GPGKEY")
#for f in pkgs/*; do
#    gpg "${gpg_args[@]}" "$f"
#done
LANG=C repo-add -v $(readlink -f repo/"$pkgrepo".db) pkgs/*
mv -v pkgs/* -t repo
#gpg "${gpg_args[@]}" --output "pkgs/${db_path##*/}".sig "$db_path"
#mv -v "pkgs/${db_path##*/}".sig -t repo

{ set +ex; } 2>/dev/null
