#!/bin/bash

REMOTE=$1
REPO_URL=$2

git remote add -f $REMOTE $REPO_URL
git checkout -b "${REMOTE}_master" $REMOTE/master
git checkout master
git read-tree --prefix="${REMOTE}/" -u "${REMOTE}_master"

# Save remotes in case of a clean clone
git remote -v | \
	grep -v 'cruseau' | \
	sed 's/\t/ /' | \
	cut -f 1,2 -d ' ' | \
	uniq > remotes.txt
git add remotes.txt
