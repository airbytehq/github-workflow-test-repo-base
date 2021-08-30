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

echo "Bumped version to ${NEW_VERSION}"
echo "Building and publishing version $NEW_VERSION for git revision $GIT_REVISION..."

echo
echo "Changelog:"
PAGER=cat git log 206793dfd3d863d484851f4b7fae0e87cd87a8f0..${GIT_REVISION} --oneline --decorate=no


echo
echo "Final Steps:"
echo "1. Push your changes"
echo "2. Merge your PR"
echo "3. Switch to master"
echo "4. Run ./tools/bin/tag_version.sh"
echo "5. Create a GitHub release with the changelog"