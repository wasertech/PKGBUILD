#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${3}"
export PKGEXT=".pkg.tar.xz"

# Variables declaration.
declare -r pkgslug="$1"
declare -r pkgtag="$2"
declare -r pkgrepo="${1#*/}"
declare SIGN_PKG=

# Set up gpg options
mkdir -p "$HOME/.gnupg"
chmod 700 "$HOME/.gnupg"
echo 'auto-key-retrieve:0:1' | gpgconf --change-options gpg
echo 'keyserver:0:"hkps%3a//pgp.mit.edu' | gpgconf --change-options dirmngr
if [[ -r master/signing.key ]]; then
  gpg --import master/signing.key
  gpg --export --armor | sudo tee /usr/share/pacman/keyrings/pkgbuild.gpg >/dev/null
  gpg -k --with-colons | grep -m1 '^fpr' | cut -d: -f10 | sed 's/$/:4:/' | sudo tee /usr/share/pacman/keyrings/pkgbuild-trusted >/dev/null
  sudo pacman-key --populate pkgbuild
  SIGN_PKG=--sign
fi

# Enable multilib repository.
sudo sed -i -e "/\[multilib\]/,/Include/s/^#//" "/etc/pacman.conf"

# Add configuration for repository.
cat - /etc/pacman.conf > /tmp/pacman.conf.new << EOF
[${pkgrepo}]
SigLevel = Optional TrustAll
Server = https://github.com/${pkgslug}/releases/download/${pkgtag}
EOF
sudo cp /tmp/pacman.conf.new /etc/pacman.conf

# Sync repositories
sudo pacman -Sy

# Build and sign packages
PKGDEST=repo LC_MESSAGES=C makepkg -Lcs --noconfirm $SIGN_PKG

# Build repo update
LANG=C repo-add master/pkgbuild.db.tar repo/*"$PKGEXT"

{ set +ex; } 2>/dev/null
