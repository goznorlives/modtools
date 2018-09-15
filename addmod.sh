#! /bin/bash

while getopts 'n:u:' OPT; do
	case ${OPT} in
		n) NAME=${OPTARG}		;;
		u) REPO_URL=${OPTARG}		;;
	esac
done
shift $((OPTIND - 1))

if [ -z ${NAME} ] || [ -z ${REPO_URL} ]; then
	echo "${0##/} [-n <mod name>] [-u <repo URL>]" >&2
	exit 1
fi

pushd .config > /dev/null

if ! grep -q "$NAME" modlist.txt; then
	if [ -f modlist.txt ]; then
		cp -f modlist.txt ../modlist.bak
		cp -f modlist.txt modlist.new
	fi

	echo "${NAME} ${REPO_URL}" >> modlist.new
	cat modlist.new | sort | uniq > modlist.txt
	rm modlist.new
	git add modlist.txt
fi

popd > /dev/null
