#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${3}"

# Variables declaration.
declare -r pkgslug="$1"
declare -r pkgtag="$2"
declare -r pkgrepo="${1#*/}"
declare -a MAKEPKG_OPT=() REPO_ADD_OPT=()

# Enable multilib repository.
sudo sed -i -e "/\[multilib\]/,/Include/s/^#//" "/etc/pacman.conf"

# Add configuration for repository.
sudo tee -a "/etc/pacman.conf" << EOF
[${pkgrepo}]
SigLevel = Optional TrustAll
Server = https://github.com/${pkgslug}/releases/download/${pkgtag}
EOF

# Sync repositories
sudo pacman -Sy

# Set up gpg options
mkdir "$HOME/.gnupg"
echo 'auto-key-retrieve:0:1' | gpgconf --change-options gpg
#echo 'keyserver:0:"hkps%3a//pgp.mit.edu"' | gpgconf --change-options dirmngr
if [[ -r signing.key ]]; then
  gpg --import signing.key
  MAKEPKG_OPT+=(--sign)
  REPO_ADD_OPT+=(--sign)
fi

# Build and sign packages
PKGDEST=repo LC_MESSAGES=C makepkg -Lcs --noconfirm "${MAKEPKG_OPT[@]}"

# Build repo update
LANG=C repo-add -s "${REPO_ADD_OPT[@]}" master/pkgbuild.db.tar repo/*.pkg.*

{ set +ex; } 2>/dev/null
