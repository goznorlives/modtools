#!/bin/bash

REMOTE=$1

if git remote | grep "${REMOTE}" > /dev/null; then
	git checkout "${REMOTE}_master" || exit 1
	git pull
	git checkout master
	git merge --squash -s subtree --no-commit --allow-unrelated-histories "${REMOTE}_master"
else
	REPO_URL="$(grep $REMOTE remotes.txt | cut -f2 -d' ')" 

	if ! [ -z $REPO_URL ]; then
		git remote add -f $REMOTE $REPO_URL
	else
		echo "Remote $REMOTE didn't exist and wasn't in remotes.txt."
		exit 1
	fi
fi
