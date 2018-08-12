#! /bin/bash

. .config/config

NAME=$1

if [ -z $1 ]; then
	echo "Mod name is required!"
	exit 1
fi
if ! [ -d $MODROOT/$NAME ]; then
	echo "Mod $NAME does not exist!"
	exit 1
fi

echo UPDATE $NAME
(
	cd $MODROOT/$NAME
	git pull --ff-only
)
