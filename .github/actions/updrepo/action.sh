#!/bin/bash

set -x

mkdir -p repo files

# adapted from repo-add
pushd files >/dev/null
if ( shopt -s nullglob; files=(*); (( ${#files[*]} )) ); then
	tar -cJf ../repo/"$REPONAME".files.tar.xz *
	tar -cJf ../repo/"$REPONAME".db.tar.xz --exclude files *
else
	tar -cJf ../repo/"$REPONAME".files.tar.xz -T /dev/null
	tar -cJf ../repo/"$REPONAME".db.tar.xz -T /dev/null
fi
popd >/dev/null

ln -s "$REPONAME".db.tar.xz repo/"$REPONAME".db
ln -s "$REPONAME".files.tar.xz repo/"$REPONAME".files
