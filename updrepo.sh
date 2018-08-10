#!/bin/bash

set -ex

declare -r pkgrepo="${1#*/}"

mkdir -p repo files

# adapted from repo-add
pushd files >/dev/null
if ( shopt -s nullglob; files=(*); (( ${#files[*]} )) ); then
	tar -cJf ../repo/"$pkgrepo".files.tar.xz *
	tar -cJf ../repo/"$pkgrepo".db.tar.xz --exclude files *
else
	tar -cJf ../repo/"$pkgrepo".files.tar.xz -T /dev/null
	tar -cJf ../repo/"$pkgrepo".db.tar.xz -T /dev/null
fi
popd >/dev/null

ln -s "$pkgrepo".db.tar.xz repo/"$pkgrepo".db
ln -s "$pkgrepo".files.tar.xz repo/"$pkgrepo".files

if [[ -r signing.key ]]; then
	mkdir -p "$HOME/.gnupg"
	gpg --import signing.key
	for f in db files; do
		gpg --detach-sign --use-agent --no-armor "$pkgrepo.$f.tar.xz"
	done
fi

{ set +ex; } 2>/dev/null
