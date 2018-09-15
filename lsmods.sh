#! /bin/bash

. ${MODTOOLS_ROOT}/.config/config

while getopts ":v" OPT; do
	case ${OPT} in
		v ) VERBOSE=1					;;
		\? ) echo "${0##/} [ -v ]" >&2; exit 1	;;
	esac
done	
shift $((OPTIND-1))

cat ${MODLIST} | while read LINE; do
	if [[ "${VERBOSE}" -eq 1 ]]; then
		echo ${LINE}
	else
		echo "$(echo ${LINE} | cut -f1 -d' ' )"
	fi
done
