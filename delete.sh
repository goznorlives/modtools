#! /bin/bash

# For the sake of completeness...

. config

NAME=$1

if [ -z $NAME ]; then
	echo A mod name is required!
	exit 1
fi
if ! [ -d $MODROOT/$NAME ]; then
	echo Mod $NAME did not exist!
	exit 1
fi

rm -rI $MODROOT/$NAME
mv modlist.txt modlist.bak
(cat modlist.txt | grep -v $NAME) > modlist.txt
