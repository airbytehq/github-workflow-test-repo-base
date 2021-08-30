#!/usr/bin/env bash

set -e

#PART_TO_BUMP=$VERSION
[[ -z "$PART_TO_BUMP" ]] && echo "Usage ./bump_version.sh (major|minor|patch)" && exit 1

# uses .bumpversion.cfg to find files to bump
# requires no git diffs to run
# commits the bumped versions code to your branch
pip install bumpversion
bumpversion "$PART_TO_BUMP"

NEW_VERSION=$(grep VERSION version.txt | cut -d"=" -f2)
GIT_REVISION=$(git rev-parse HEAD)
[[ -z "$GIT_REVISION" ]] && echo "Couldn't get the git revision..." && exit 1

echo "Bumped version from ${PREV_VERSION} to ${NEW_VERSION}"
echo "Building and publishing version $NEW_VERSION for git revision $GIT_REVISION..."