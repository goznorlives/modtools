#! /bin/bash

cat .config/modlist.txt | while read LINE; do
	NAME="$( echo $LINE | cut -f1 -d' ' )"

	./update.sh -n $NAME
	echo
done
