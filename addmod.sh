#! /bin/bash

. ${MODTOOLS_ROOT}/.config/config

MODLIST_BAK=${MODTOOLS_ROOT}/modlist.bak
MODLIST_TMP=${MODTOOLS_ROOT}/.config/modlist.tmp

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

pushd ${MODTOOLS_ROOT} > /dev/null

if ! grep -q "${NAME}" ${MODLIST}; then
	if [ -f ${MODLIST} ]; then
		cp -f ${MODLIST} ${MODLIST_BAK}
		mv ${MODLIST} ${MODLIST_TMP}
	fi

	echo "${NAME} ${REPO_URL}" >> ${MODLIST_TMP}
	cat ${MODLIST_TMP} | sort | uniq > ${MODLIST}
	rm -f ${MODLIST_TMP}
	git add ${MODLIST}
fi

popd > /dev/null
