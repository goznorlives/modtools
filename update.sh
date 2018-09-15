#! /bin/bash

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
	echo "Mod ${NAME} does not exist!"
	exit 1
fi

pushd ${MODS_ROOT}/${NAME} > /dev/null

echo UPDATE ${NAME}
git pull --ff-only

popd > /dev/null
