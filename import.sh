#!/bin/bash

# TODO Allow config of this
# Assuming this was cloned into .minetest/mods...
MODROOT=..

NAME=$1
REPO_URL=$2

git clone $REPO_URL $MODROOT/$NAME

# Save repo so we can do a mass update or import later if we want to
echo "${NAME} ${REPO_URL}" >> modlist.txt
git add modlist.txt
