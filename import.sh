#!/bin/bash

. ${MODTOOLS_ROOT}/.config/config

while getopts 'n:u:' OPT; do
	case ${OPT} in
		n)
			NAME=${OPTARG}
			;;
		u)
			REPO_URL=${OPTARG}						
			;;
	esac
done
shift $((OPTIND - 1))

if [ -z ${NAME} ] || [ -z ${REPO_URL} ]; then
	echo "${0##/} [-n <mod name>] [-u <repo URL>]" >&2
	exit 1
fi
if [ -d ${MODS_ROOT}/${NAME} ]; then
	echo "Something already exists at ${MODS_ROOT}/${NAME}!"
	exit 1
fi

git clone ${REPO_URL} ${MODS_ROOT}/${NAME} || exit 1

# Save repo so we can do a mass update or import later if we want to
${MODTOOLS_ROOT}/addmod.sh -n ${NAME} -u ${REPO_URL}
