#!/bin/bash

set -ex

# Variables declaration.
declare pkgslug="${1}"

# Download or create repository database repository "aurci"
cd "bin"
if curl -f -L "https://github.com/${pkgslug}/releases/download/repository/aurci.{db,files}.tar.gz" -o "aurci.#1.tar.gz"; then
  ln -s "aurci.db.tar.gz" "aurci.db"
  ln -s "aurci.files.tar.gz" "aurci.files"
else
  rm -f "aurci.db.tar.gz" "aurci.files.tar.gz"
  repo-add "aurci.db.tar.gz"
fi
cd ".."

# Add configuration for repository "aurci".
sudo tee -a "/etc/pacman.d/aurci" << EOF
[options]
CacheDir = /var/cache/pacman/pkg
CacheDir = /home/pkguser/bin
CleanMethod = KeepCurrent

[aurci]
SigLevel = Optional TrustAll
Server = file:///home/pkguser/bin
Server = https://github.com/${pkgslug}/releases/download/repository
EOF

# Add repository "aurutilsci" and incude "aurci".
sudo tee -a "/etc/pacman.conf" << EOF

[aurutilsci]
SigLevel = Optional TrustAll
Server = https://github.com/localnet/aurutilsci/releases/download/repository

Include = /etc/pacman.d/aurci
EOF

# Sync repositories and install "aurutils".
sudo pacman -Sy --noconfirm aurutils

{ set +ex; } 2>/dev/null
