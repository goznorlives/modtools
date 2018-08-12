#! /bin/bash

# For the sake of completeness...

. config

NAME=$1

if [ -d $MODROOT/$NAME ]; then
	rm -rI $MODROOT/$NAME
else
	echo Mod $NAME did not exist!
	exit 1
fi
