#! /bin/bash

. config

cat modlist.txt | while read LINE; do
	NAME="$( echo $LINE | cut -f1 -d' ' )"
	REPO_URL="$( echo $LINE | cut -f2 -d' ' )"

	./import.sh $NAME $REPO_URL
done
