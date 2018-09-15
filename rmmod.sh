#! /bin/bash

. ${MODTOOLS_ROOT}/.config/config

MODLIST_BAK=${MODTOOLS_ROOT}/modlist.bak
MODLIST_TMP=${MODTOOLS_ROOT}.config/~modlist.txt

while getopts 'n:' OPT; do
	case ${OPT} in
		n)
			NAME=${OPTARG}
			;;
	esac
done
shift $((OPTIND - 1))

if [ -z ${NAME} ]; then
	echo "${0##/} [-n <mod name>]" >&2
	exit 1
fi

cp -f ${MODLIST} ${MODLIST_BAK}
(cat ${MODLIST} | grep -v $NAME) > ${MODLIST_TMP}
rm -f ${MODLIST}
mv ${MODLIST_TMP} ${MODLIST}
git add ${MODLIST}
