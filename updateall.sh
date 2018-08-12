#! /bin/bash

. config

cat modlist.txt | while read LINE; do
	NAME="$( echo $LINE | cut -f1 -d' ' )"

	./update.sh $NAME
	echo
done
