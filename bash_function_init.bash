#! /bin/bash

function bash_function_init ()
#
#
#
{

	declare __bash_function_init_{opts,{locv,glbv}_{strings,arrays}}=
	__bash_function_init_opts=(
		source
	)
	__bash_function_init_locv_strings=()
	__bash_function_init_locv_arrays=()
	__bash_function_init_glbv_strings=()
	__bash_function_init_glbv_arrays=()

	declare INIT_SOURCE=
	declare RGX=".*[^[:blank:]]([[:blank:]]*### BASH_FUNCTION_INIT SOURCE ###.*### BASH_FUNCTION_INIT SOURCE ###).*"
	[[ "$( < "${BASH_SOURCE[0]}" )" =~ ${RGX} ]] \
	&& INIT_SOURCE="${BASH_REMATCH[1]}" \
	|| INIT_SOURCE="echo \"${FUNCNAME[0]}: FAIL\" 1>&2; return 1"

	eval "${INIT_SOURCE}"

	[ "${OPT_source:-0}" -eq 0 ] \
	|| {
		echo "${INIT_SOURCE}"
		return 0
	}

	[ "${*:-}" != "" ] \
	|| {
		sed "s/^[[:blank:]]*//" 1>&2 <<-'EOF'

		To initialize your function,
		insert the following line at the beginning of your function..

		: BASH_FUNCTION_INIT SOURCE; {
		declare -F bash_function_init &>/dev/null \
		&& eval "$( bash_function_init --source )" \
		|| { echo : NO_BASH_FUNCTION_INIT 1>&2; return 1; }
		: BASH_FUNCTION_INIT SOURCE; }

		If you want to be able to run the function as a script,
		or warn users that it is not to be run as a script,
		add the following to the end of your function source,
		*OUTSIDE* of the function.

		: BASH_FUNCTION_INIT; I="${BASH_SOURCE[0]##*/}" && ${I%.*} --init ${@:+"${@}"}

		WARNING::
		Assumes your function is *EQUAL* to the name of your script,
		minus an extension. ( ie. ".bash", ".bash_function", etc. )

		EOF
		[ -t 1 ] || echo return 1
		return 1
	}

	declare -p ${LOCV[*]} ${GLBV[*]} 1>&2

	return 0

	### BASH_FUNCTION_INIT SOURCE ###

	#
	for __bash_function_init_ent in __bash_function_init_{opts,{locv,glbv}_{strings,arrays}}
	do
		eval "declare -p ${__bash_function_init_ent}" &>/dev/null \
		|| {
			printf "\n: Set the following in your function, before the call to BASH_FUNCTION_INIT..\n\n"
			printf "declare %s=\n" "__bash_function_init_{opts,{locv,glbv}_{strings,arrays}}"
			printf "%s=()\n" __bash_function_init_{opts,{locv,glbv}_{strings,arrays}}
			printf "\n"
			return 1
		} 1>&2
	done

	#
	__bash_function_init_fnc="${FUNCNAME[0]:-}"
	__bash_function_init_tag="$( echo "${__bash_function_init_fnc}" | tr "[:lower:]" "[:upper:]" )"

	#
	__bash_function_init_opts=(
		help
		init
		exec
		${__bash_function_init_opts:+"${__bash_function_init_opts[@]}"}
	)
	__bash_function_init_locv_strings=(
		FNC TAG TMP ENT VAR VAL I J K
		TAB NLN CRT
		FLG_sourced
		${__bash_function_init_locv_strings:+"${__bash_function_init_locv_strings[@]}"}
	)
	__bash_function_init_locv_arrays=(
		LOCV
		GLBV
		ARGS
		${__bash_function_init_locv_arrays:+"${__bash_function_init_locv_arrays[@]}"}
	)
	__bash_function_init_glbv_strings=(
		DEBUG_${__bash_function_init_tag}
		${__bash_function_init_glbv_strings:+"${__bash_function_init_glbv_strings[@]}"}
	)
	__bash_function_init_glbv_arrays=(
		${__bash_function_init_glbv_arrays:+"${__bash_function_init_glbv_arrays[@]}"}
	)

	#
	for __bash_function_init_var in ${__bash_function_init_locv_strings[*]:-}
	do
		eval "declare ${__bash_function_init_var}="
	done
	for __bash_function_init_var in ${__bash_function_init_locv_arrays[*]:-}
	do
		eval "declare ${__bash_function_init_var}=()"
	done
	for __bash_function_init_var in ${__bash_function_init_glbv_strings[*]:-} ${__bash_function_init_glbv_arrays[*]:-}
	do
		eval "export ${__bash_function_init_var}"
	done
	for __bash_function_init_var in ${__bash_function_init_glbv_strings[*]:-}
	do
		eval "${__bash_function_init_var}=\${${__bash_function_init_var}:-}"
	done
	for __bash_function_init_var in ${__bash_function_init_glbv_arrays[*]:-}
	do
		eval "${__bash_function_init_var}=( \${${__bash_function_init_var}[@]:+\"\${${__bash_function_init_var}[@]}\"} )"
	done

	#
	eval "printf -v TAB \"\t\""
	eval "printf -v NLN \"\n\""
	eval "printf -v CRT \"\r\""
	eval "FNC=\"\${__bash_function_init_fnc}\""
	eval "TAG=\"\${__bash_function_init_tag}-\${RANDOM}-\${SECONDS}\""

	#
	for __bash_function_init_ent in ${__bash_function_init_opts[*]%%=*}
	do
		eval "declare OPT_${__bash_function_init_ent}=0"
	done
	for (( __bash_function_init_ent=1; __bash_function_init_ent<=${#@}; __bash_function_init_ent++ ))
	do
		eval "__bash_function_init_val=\"\${${__bash_function_init_ent}}\""
		case "${__bash_function_init_val}" in
			( -h* ) {
				OPT_help=1
				break
			};;
			( --* ) {
				eval "OPT_${__bash_function_init_val#--}=1"
			};;
			( * ) ARGS[${#ARGS[@]}]="${__bash_function_init_val}";;
		esac
	done
	[ "${BASH_SOURCE[0]}" == "${0}" -o "${#BASH_SOURCE[@]}" -eq 0 ] && FLG_sourced=0 || FLG_sourced=1

	#
	LOCV=( ${__bash_function_init_opts[*]/#/OPT_} ${__bash_function_init_locv_strings[*]:-} ${__bash_function_init_locv_arrays[*]:-} )
	GLBV=( ${__bash_function_init_glbv_strings[*]:-} ${__bash_function_init_glbv_arrays[*]:-} )

	#
	[ "${FLG_sourced:-0}" -eq 1 -o "${OPT_exec:-0}" -eq 1 ] \
	|| {
		sed "s/^/  /" <<-EOF

		You are attempting to run this function as a script.
		It's really meant to be run within your shell session.

		source ${BASH_SOURCE[0]}

		If you really wish to run it as a script, then provide this argument..

		--exec

		EOF
		return 1
	} 1>&2

	[ "${OPT_init:-0}" -eq 0 -o "${OPT_exec:-0}" -eq 1 -o "${#ARGS[@]}" -gt 0 ] \
	|| return 0

	#
	unset ${!__bash_function_init*}

	### BASH_FUNCTION_INIT SOURCE ###

}

I="${BASH_SOURCE[0]##*/}" && ${I%.*} --init ${@:+"${@}"}
