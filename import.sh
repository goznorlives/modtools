#!/bin/bash

. config

NAME=$1
REPO_URL=$2

if [ -z $1 ]; then
	echo "Mod name is required!"
	exit 1
fi
if [ -z $2 ]; then
	echo "Mod repository URL is required!"
	exit 1
fi
if [ -d $MODROOT/$NAME ]; then
	echo "Something already exists at $MODROOT/$NAME!"
	exit 1
fi

git clone $REPO_URL $MODROOT/$NAME

# Save repo so we can do a mass update or import later if we want to
cp modlist.txt modlist.bak
echo "${NAME} ${REPO_URL}" >> modlist.txt
cat modlist.txt | uniq > modlist.txt
git add modlist.txt

