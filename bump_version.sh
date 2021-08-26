#!/usr/bin/env bash

set -e

PART_TO_BUMP=$VERSION
[[ -z "$PART_TO_BUMP" ]] && echo "Usage ./bump_version.sh (major|minor|patch)" && exit 1

# uses .bumpversion.cfg to find files to bump
# requires no git diffs to run
# commits the bumped versions code to your branch
pip install bumpversion
bumpversion "$PART_TO_BUMP"
