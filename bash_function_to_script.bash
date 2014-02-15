#! /bin/bash

I="${PWD##*/}"
I="${I%.git}"

[ -z "${I}" ] \
|| {
	{
		echo '#! /bin/bash'
		find . -name "*.bash_function" |
		while read ENT
		do
			printf "%s:%s\n" "$( echo "${ENT}" | grep -o / | grep -c / )" "${ENT}"
		done |
		sort -t: -k 1,1gr -k 2,99 |
		cut -d: -f2- |
		while read SRC
		do
			for CNT in $( egrep -nh "^function[[:blank:]]{1,}[0-9a-zA-Z_-]{1,}[[:blank:]]{1,}\(\)" "${SRC}" | cut -d: -f1 )
			do
				echo
				sed -n "${CNT},/^}\$/p" "${SRC}"
			done
		done
		printf "\n%s\n" ': BASH_FUNCTION_INIT RUN; I="${BASH_SOURCE[0]##*/}"; [ "${I}" != "${0}" -a "${#BASH_SOURCE[@]}" -ne 0 ] || ${I%.*} ${@:+"${@}"}'
	} > "${I}"
}
