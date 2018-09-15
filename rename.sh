#! /bin/bash

# For the sake of completeness...

. ${MODTOOLS_ROOT}/.config/config

while getopts 'n:w:' OPT; do
	case ${OPT} in
		n)
			NAME=${OPTARG}
			;;
	esac
	case ${OPT} in
		w)
			NEWNAME=${OPTARG}
			;;
	esac
done
shift $((OPTIND - 1))

if [ -z ${NAME} ] || [ -z ${NEWNAME} ]; then
	echo "${0##/} [-n <mod name> -w <new name>]" >&2
	exit 1
fi
if ! [ -d ${MODS_ROOT}/${NAME} ]; then
	echo Mod ${NAME} did not exist!
	exit 1
fi
if [ -d ${MODS_ROOT}/${NEWNAME} ]; then
	echo Something already exists with name ${NEWNAME}!
	exit 1
fi

cat ${MODLIST} | grep "^${NAME}" | while read LINE; do
	REPO_URL="$(echo ${LINE} | cut -f2 -d' ')"
	${MODTOOLS_ROOT}/rmmod.sh -n ${NAME} &&
		${MODTOOLS_ROOT}/addmod.sh -n ${NEWNAME} -u ${REPO_URL} &&
		mv -f ${MODS_ROOT}/${NAME} ${MODS_ROOT}/${NEWNAME}
done




