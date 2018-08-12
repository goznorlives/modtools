#!/bin/bash

for dir in */
do
	echo "UPDATING ${dir%/}"
	./update.sh ${dir%/}
	echo
done
