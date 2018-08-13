#! /bin/bash

. .config/config

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
if ! [ -d $MODROOT/$NAME ]; then
	echo "Mod $NAME does not exist!"
	exit 1
fi

echo UPDATE $NAME
( cd $MODROOT/$NAME; git pull --ff-only)
