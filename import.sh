#!/bin/bash

. config

NAME=$1
REPO_URL=$2

if ! [ -d $MODROOT/$NAME ]; then
	git clone $REPO_URL $MODROOT/$NAME

	# Save repo so we can do a mass update or import later if we want to
	echo "${NAME} ${REPO_URL}" >> modlist.txt
	git add modlist.txt
else
	echo Something already exists at $MODROOT/$NAME!
	exit 1
fi

