#! /bin/bash

function bash_function_init ()
#
#
#
{

	declare FNC="BASH_FUNCTION_INIT"
	declare RGX=".*[^[:blank:]]([[:blank:]]*### ${FNC} ###.*### ${FNC} ###).*"
	[[ "$( < "${BASH_SOURCE[0]}" )" =~ ${RGX} ]] \
	&& echo "${BASH_REMATCH[1]}" \
	|| echo "echo \"${FNC}: FAIL\" 1>&2; return 1"

	return 0

	### BASH_FUNCTION_INIT ###

	#
	for __bash_function_ent in __bash_function_{opts,{locv,glbv}_{strings,arrays}}
	do
		eval "declare -p ${__bash_function_ent}" &>/dev/null \
		|| {
			printf "\n: Set the following in your function, before the call to BASH_FUNCTION_INIT..\n\n"
			printf "\tdeclare %s=()\n" __bash_function_{opts,_{locv,glbv}_{strings,arrays}}
			printf "\n"
			return 1
		} 1>&2
	done

	#
	__bash_function_fnc="${FUNCNAME[0]:-}"
	__bash_function_tag="$( echo "${__bash_function_fnc}" | tr "[:lower:]" "[:upper:]" )"

	#
	__bash_function_opts=(
		help
		init
		exec
		${__bash_function_opts:+"${__bash_function_opts[@]}"}
	)
	__bash_function_locv_strings=(
		FNC TAG TMP ENT VAR VAL I J K
		TAB NLN CRT
		FLG_sourced
		${__bash_function_locv_strings:+"${__bash_function_locv_strings[@]}"}
	)
	__bash_function_locv_arrays=(
		LOCV
		GLBV
		ARGS
		${__bash_function_locv_arrays:+"${__bash_function_locv_arrays[@]}"}
	)
	__bash_function_glbv_strings=(
		DEBUG_${__bash_function_tag}
		${__bash_function_glbv_strings:+"${__bash_function_glbv_strings[@]}"}
	)
	__bash_function_glbv_arrays=(
		${__bash_function_glbv_arrays:+"${__bash_function_glbv_arrays[@]}"}
	)

	#
	for __bash_function_var in ${__bash_function_locv_strings[*]:-}
	do
		eval "declare ${__bash_function_var}="
	done
	for __bash_function_var in ${__bash_function_locv_arrays[*]:-}
	do
		eval "declare ${__bash_function_var}=()"
	done
	for __bash_function_var in ${__bash_function_glbv_strings[*]:-} ${__bash_function_glbv_arrays[*]:-}
	do
		eval "export ${__bash_function_var}"
	done
	for __bash_function_var in ${__bash_function_glbv_strings[*]:-}
	do
		eval "${__bash_function_var}=\${${__bash_function_var}:-}"
	done
	for __bash_function_var in ${__bash_function_glbv_arrays[*]:-}
	do
		eval "${__bash_function_var}=( \${${__bash_function_var}[@]:+\"\${${__bash_function_var}[@]}\"} )"
	done

	#
	eval "printf -v TAB \"\t\""
	eval "printf -v NLN \"\n\""
	eval "printf -v CRT \"\r\""
	eval "FNC=\"\${__bash_function_fnc}\""
	eval "TAG=\"\${__bash_function_tag}-\${RANDOM}-\${SECONDS}\""

	#
	for __bash_function_ent in ${__bash_function_opts[*]%%=*}
	do
		eval "declare OPT_${__bash_function_ent}=0"
	done
	for (( __bash_function_ent=1; __bash_function_ent<=${#@}; __bash_function_ent++ ))
	do
		eval "__bash_function_val=\"\${${__bash_function_ent}}\""
		case "${__bash_function_val}" in
			( -h* ) {
				OPT_help=1
				break
			};;
			( --* ) {
				eval "OPT_${__bash_function_val#--}=1"
			};;
			( * ) ARGS[${#ARGS[@]}]="${__bash_function_val}";;
		esac
	done
	[ "${BASH_SOURCE[0]}" == "${0}" -o "${#BASH_SOURCE[@]}" -eq 0 ] && FLG_sourced=0 || FLG_sourced=1

	#
	LOCV=( ${__bash_function_opts[*]/#/OPT_} ${__bash_function_locv_strings[*]:-} ${__bash_function_locv_arrays[*]:-} )
	GLBV=( ${__bash_function_glbv_strings[*]:-} ${__bash_function_glbv_arrays[*]:-} )

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
	unset ${!__bash_function*}

	### BASH_FUNCTION_INIT ###

}

function bash_function_make ()
#
#
#
{
	:
}

function bash_function_help ()
#
#
#
{
	sed "s/^/  /" <<-'EOF'
	
	To initialize your function, insert the following line at the beginning of your function..
	
	: BASH_FUNCTION_INIT; eval "$( bash_function_init )"

	EOF
}

bash_function_help ${@:+"${@}"}
