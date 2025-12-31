#!/bin/bash

RELEASE=$(curl  -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/sass/dart-sass/releases/latest)
VERSION=$(echo $RELEASE | jq -r ".tag_name" | sed -s 's/^v//')

if [ -z "$VERSION" ] || [ "$VERSION" = "null" ]; then
  echo "Error: VERSION is empty or null"
  exit 1
fi

echo "${VERSION}" > VERSION
git config --global user.name 'Github Actions Michal'
git config --global user.email 'michal.klempa@gmail.com'
git add VERSION Dockerfile
git commit -m"Upstream version bump to ${VERSION}"
git tag -f "${VERSION}"
git push
git push --tags
