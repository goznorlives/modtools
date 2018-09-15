#! /bin/bash

# For the sake of completeness...

. ${MODTOOLS_ROOT}/.config/config

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
if ! [ -d ${MODS_ROOT}/${NAME} ]; then
	echo Mod ${NAME} did not exist!
	exit 1
fi

rm -rI ${MODS_ROOT}/${NAME} || exit 1

# Remove from mod list for consitency
${MODTOOLS_ROOT}/rmmod.sh -n ${NAME}
