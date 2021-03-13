#!/bin/bash

set -ex

# Get author/committer info from triggering branch commit
export GIT_AUTHOR_NAME=$(git show -s --pretty='%an') \
    GIT_AUTHOR_EMAIL=$(git show -s --pretty='%ae') \
    GIT_COMMITTER_NAME=$(git show -s --pretty='%cn') \
    GIT_COMMITTER_EMAIL=$(git show -s --pretty='%ce')

# Commit files from repo tarball
mkdir -p master/files
pushd master/files >/dev/null

remove_pkg() {
  pkgname=$1
  for pkgentry in "$pkgname"*; do
    name=${pkgentry##*/}
    if [[ ${name%-*-*} = $pkgname ]]; then
      git rm -r "$pkgentry"
    fi
  done
}

until
    tar --warning=no-unknown-keyword -tf ../pkgbuild.files.tar |
      sed 's,-[^-]*-[^-]*/.*,,' |
      sort -u |
      while read pkg; do
        remove_pkg "$pkg"
      done
    tar --warning=no-unknown-keyword -xf ../pkgbuild.files.tar -C .
    git add .
    if ! git diff-index --quiet HEAD --; then
      git commit -m "update package ${GITHUB_REF##*/}"
      git push "https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY" master
    fi
do
  git reset --hard origin/master
  git clean -fdx .
  git pull --ff-only origin master
done

popd >/dev/null

{ set +ex; } 2>/dev/null
