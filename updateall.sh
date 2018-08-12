#! /bin/bash

# TODO Allow config of this
MODROOT=..

cat modlist.txt | while read LINE; do
	NAME="$( echo $LINE | cut -f1 -d' ' )"
	update.sh $NAME
done
