#! /bin/bash

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

cp -f .config/modlist.txt modlist.bak
(cat .config/modlist.txt | grep -v $NAME) > .config/modlist.new
mv -f .config/modlist.new .config/modlist.txt
git add .config/modlist.txt
