#! /bin/bash

. ${MODTOOLS_ROOT}/.config/config

cat ${MODLIST} | while read LINE; do
	NAME="$( echo ${LINE} | cut -f1 -d' ' )"
	REPO_URL="$( echo ${LINE} | cut -f2 -d' ' )"

	${MODTOOLS_ROOT}/import.sh -n ${NAME} -u ${REPO_URL}
	echo
done
