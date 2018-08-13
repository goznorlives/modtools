#! /bin/bash

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

if [ -f .config/modlist.txt ]; then
	cp -f .config/modlist.txt modlist.bak
	cp -f .config/modlist.txt .config/modlist.new
fi

echo "${NAME} ${REPO_URL}" >> .config/modlist.new
cat .config/modlist.new | uniq > .config/modlist.txt
mv -f .config/modlist.new .config/modlist.txt
git add .config/modlist.txt

