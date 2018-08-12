#!/bin/bash

. .config/config

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

git clone $REPO_URL $MODROOT/$NAME || exit 1

# Save repo so we can do a mass update or import later if we want to
cp -f .config/modlist.txt modlist.bak
cp .config/modlist.txt .config/modlist.new
echo "${NAME} ${REPO_URL}" >> .config/modlist.new
cat .config/modlist.new | uniq > .config/modlist.txt
mv -f .config/modlist.new .config/modlist.txt
git add .config/modlist.txt
