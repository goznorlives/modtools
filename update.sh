#! /bin/bash

# TODO Allow config of this
MODROOT=..

NAME=$1

if [ -d $MODROOT/$NAME ]; then
	pushd $MODROOT/$NAME > /dev/null
	echo UPDATE $NAME
	git pull --ff-only
	popd > /dev/null
else
	echo Mod $NAME does not exist!
	exit 1
fi
