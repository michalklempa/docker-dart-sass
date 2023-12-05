#!/bin/bash

RELEASE=$(curl  -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/sass/dart-sass/releases/latest)
VERSION=$(echo $RELEASE | jq -r ".tag_name" | sed -s 's/^v//')

sed -i '1c ARG UPSTREAM_VERSION='"${VERSION}" Dockerfile
git config --global user.name 'Github Actions Michal'
git config --global user.email 'michal.klempa@gmail.com'
git add Dockerfile
git commit -m"Upstream version bump to ${VERSION}"
git tag -f "${VERSION}"
git push --tags
git push
