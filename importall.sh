#! /bin/bash

# TODO Allow config of this
MODROOT=..

cat modlist.txt | while read LINE; do
	NAME="$( echo $LINE | cut -f1 -d' ' )"
	REPO_URL="$( echo $LINE | cut -f2 -d' ' )"

	if ! [ -d $MODROOT/$NAME ]; then
		git clone $REPO_URL $MODROOT/$NAME
	else
		echo $NAME already imported!
	fi
done
