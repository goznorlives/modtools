#! /bin/bash

. ${MODTOOLS_ROOT}/.config/config

cat ${MODLIST} | while read LINE; do
	NAME="$( echo ${LINE} | cut -f1 -d' ' )"

	${MODTOOLS_ROOT}/update.sh -n ${NAME}
	echo
done
