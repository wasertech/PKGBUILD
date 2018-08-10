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

until
    # TODO: remove old versions
    tar -xf ../pkgbuild.files.tar -C .
    git add .
    git commit -m "update package $TRAVIS_BRANCH"
    git push "https://$GITHUB_USER:$GITHUB_TOKEN@github.com/$TRAVIS_REPO_SLUG" master
do
  git reset --hard
  git clean -fdx .
  git pull --ff-only origin master
done

popd >/dev/null

{ set +ex; } 2>/dev/null
