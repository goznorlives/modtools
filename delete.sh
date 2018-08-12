#! /bin/bash

# For the sake of completeness...

. .config/config

NAME=$1

if [ -z $NAME ]; then
	echo A mod name is required!
	exit 1
fi
if ! [ -d $MODROOT/$NAME ]; then
	echo Mod $NAME did not exist!
	exit 1
fi

rm -rI $MODROOT/$NAME || exit 1

# Remove from mod list for consitency
cp -f .config/modlist.txt modlist.bak
(cat .config/modlist.txt | grep -v $NAME) > .config/modlist.new
mv -f .config/modlist.new .config/modlist.txt
