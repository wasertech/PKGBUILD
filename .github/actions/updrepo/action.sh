#!/bin/bash

set -x

mkdir -p repo files

# adapted from repo-add
pushd files >/dev/null
if ( shopt -s nullglob; files=(*); (( ${#files[*]} )) ); then
	tar -cJf ../repo/"$REPO_NAME".files.tar.xz *
	tar -cJf ../repo/"$REPO_NAME".db.tar.xz --exclude files *
else
	tar -cJf ../repo/"$REPO_NAME".files.tar.xz -T /dev/null
	tar -cJf ../repo/"$REPO_NAME".db.tar.xz -T /dev/null
fi
popd >/dev/null

ln -s "$REPO_NAME".db.tar.xz repo/"$REPO_NAME".db
ln -s "$REPO_NAME".files.tar.xz repo/"$REPO_NAME".files
