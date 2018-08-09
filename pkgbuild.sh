#!/bin/bash

set -ex

# Environment variables.
export PACKAGER="https://travis-ci.org/${1}/builds/${3}"

# Variables declaration.
declare -r pkgslug="$1"
declare -r pkgtag="$2"
declare -r pkgrepo="${1#*/}"

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
#gpg --import signing.key

# Build and sign packages
PKGDEST=repo LC_MESSAGES=C makepkg -Lcs --noconfirm --sign

## Build repo update
#LANG=C repo-add master/temp.db.tar repo/*.pkg.*
#
#commit_tarball() {
#  tarball=$1
#
#  git pull --ff-only
#  bsdtar -xf "$tarball" -C files
#  git add files
#  git ci -m "update package $TRAVIS_BRANCH"
#  git push
#}
#
#pushd master >/dev/null
#until commit_files temp.files.tar; do
#  git reset --hard origin/master
#done
#popd >/dev/null

{ set +ex; } 2>/dev/null
