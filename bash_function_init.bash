#! /bin/bash

function bash_function_init ()
{

    # BASH_FUNCTION_INIT # INIT # DO NOT TOUCH # {{{

    # Pickup the last command exit code.
    # Don't put *ANYTHING* before this in your function.
    # Otherwise, you will lose the ability to store the previous return value.
    # Will add it to vars_il_ and vars____ later on, so it doesn't get erased.
    declare -ir pre_return=${?}

    # BASH_FUNCTION_INIT # INIT # DO NOT TOUCH # }}}

    # BASH_FUNCTION_INIT # SETUP # YOUR CODE HERE # START

    # Additions to opts_valid go here.
    opts_valid=(
        #my_opt     # Valid option for this function.
    )

    # Additions to string variables go here.
    # Local, Local-export, Global, Global-export
    vars_sl_=(
        #my_var     # Some variable for this funciton.
    )
    vars_slx=()
    vars_sg_=()
    vars_sgx=()
    # Additions to array variables go here.
    # Local, Local-export, Global, Global-export
    vars_al_=()
    vars_alx=()
    vars_ag_=()
    vars_agx=()
    # Additions to integer variables go here.
    # Local, Local-export
    vars_il_=()
    vars_ilx=()

    # BASH_FUNCTION_INIT # SETUP # YOUR CODE HERE # FINISH

    # BASH_FUNCTION_INIT # SETUP # DO NOT TOUCH # {{{

    # Special variable for setting valid options names.
    # This variable will be added to vars_al_ and vars____ later on.
    declare opts_valid=(
        help    # Flag for common help option.
        debug   # Debug level.
        ${opts_valid[*]}
    )

    # Default local strings.
    declare vars_sl_=(
        fnc         # Shorthand for function name.
        dbg         # Debug level of function, allowing non-integer value.
        tmp         # Default temporary variable.
        tc_spc      # Easy ref to space char.
        tc_tab      # Easy ref to tab char.
        tc_nln      # Easy ref to newline char.
        tc_crt      # Easy ref to carriage-return char.
        tc_tilde    # Easy ref to tilde char.
        tc_fslash   # Easy ref to forward-slash '/' char.
        tc_bslash   # Easy ref to back-slash '\' char.
        tc_dquote   # Easy ref to double-quote '"' char.
        tc_squote   # Easy ref to single-quote "'" char.
        tc_bang     # Easy ref to exclamation '!' char.
        tc_tick     # Easy ref to backtick '`' char.
        tc_dollar   # Easy ref to dollar-sign '$' char.
        IFS_DEF     # Easy ref to default IFS ' \t\n'.
        IFS_TN      # Easy ref to alternate IFS '\t\t\n'.
        IFS_N       # Easy ref to alternate IFS '\n\n\n'.
        IFS_RGX     # Easy ref to alternate IFS '|\n\n', mainly for using globbing to create a regex.
        IFS         # Allows local override of IFS.
        rgx         # Default regex string variable.
        rgx_sess    # An unique(?) string; usually for delimiting.
        ${vars_sl_[*]}
    )
    # Default local export strings.
    declare vars_slx=( ${vars_slx[*]} )
    # Default global strings.
    declare vars_sg_=( ${vars_sg_[*]} )
    # Default global export strings.
    declare vars_sgx=( ${vars_sgx[*]} )

    # Default arrays.
    declare vars_al_=(
        args        # Array of function args, with options removed.
        eargs       # Quoted/Sanitized/Pretty args for eval/debug/print.
        tmps        # Default temporary array.
        ${vars_al_[*]}
    )
    declare vars_alx=( ${vars_alx[*]} )
    declare vars_ag_=( ${vars_ag_[*]} )
    declare vars_agx=( ${vars_agx[*]} )

    # Default integers.
    # Btw, I don't know how to create global integer vars. =]
    declare vars_il_=(
        fnc_return  # Return value for this function.
        I J K       # Common iterators.
        flg_file0   # STDIN  is open?
        flg_file1   # STDOUT is open?
        flg_file2   # STDERR is open?
        ${vars_il_[*]}
    )
    declare vars_ilx=( ${vars_ilx[*]} )

    # Collect variables to be exported.
    declare vars___x=(
        ${vars_slx[*]} ${vars_sgx[*]}
        ${vars_alx[*]} ${vars_agx[*]}
        ${vars_ilx[*]}
    )
    # Collect all variables, mostly for reporting/debug.
    declare vars____=(
        ${vars_sl_[*]}
        ${vars_al_[*]}
        ${vars_il_[*]}
        ${vars_sg_[*]}
        ${vars_ag_[*]}
        ${vars___x[*]}
    )
    # Add options from opts_valid to variable collections.
    vars_sl_=( ${opts_valid[*]/#/opt_} ${vars_sl_[*]} )
    vars____=( ${opts_valid[*]/#/opt_} ${vars____[*]} )

    # Create array variables.
    for tmp in ${vars_ag_[*]} ${vars_agx[*]}
    do
        printf -v tmp '%s=( "${%s[@]}" )' "${tmp}" "${tmp}"
        eval "${tmp}"
    done
    # Create string variables.
    for tmp in ${vars_sg_[*]} ${vars_sgx[*]}
    do
        printf -v tmp '%s="${%s}"' "${tmp}" "${tmp}"
        eval "${tmp}"
    done
    # Localize string variables.
    for tmp in ${vars_sl_[*]} ${vars_slx[*]}; do declare    ${tmp}; done
    # Localize array variables.
    for tmp in ${vars_al_[*]} ${vars_alx[*]}; do declare -a ${tmp}; done
    # Localize integer variables and set (to zero).
    for tmp in ${vars_il_[*]} ${vars_ilx[*]}; do declare -i ${tmp}; eval "${tmp}="; done
    # Export appropriate variables.
    for tmp in ${vars___x[*]}; do export ${tmp}; done
    # Collection of export variables is no longer needed.
    unset vars___x
    tmp=

    # Add opts_valid to variable collections.
    vars_al_=( opts_valid ${vars_al_[*]} )
    vars____=( opts_valid ${vars____[*]} )
    # Add pre_return to variable collections.
    vars_il_=( pre_return ${vars_il_[*]} )
    vars____=( pre_return ${vars____[*]} )

    # Set function name variable.
    fnc="${FUNCNAME[0]}"
    # Set default function return value.
    fnc_return=0

    # Determine all-caps debug variable name for function.
    tmp="DEBUG_${fnc}"
    tmps=( {a..z} {A..Z} )
    for (( I=0; I<26; I++ ))
    do
        tmp="${tmp//${tmps[${I}]}/${tmps[$((I+26))]}}"
    done
    # Set 'dbg' to environment debug level value.
    # Triple-'}' messes with vim folding, so crappy fix is to break this apart.
    printf -v tmp 'dbg="${%s:-${%s:-}}"' "${tmp}" "${tmp#DEBUG_}_DEBUG"
    eval "${tmp}"
    printf -v tmp 'dbg="${dbg:-${DEBUG:-0}}"'
    eval "${tmp}"
    # Clear used variables.
    tmps=()
    tmp=
    I=

    # Set some default term char references.
    printf -v tc_spc    ' '
    printf -v tc_tab    '\t'
    printf -v tc_nln    '\n'
    printf -v tc_crt    '\r'
    printf -v tc_tilde  '~'
    printf -v tc_fslash '/'
    printf -v tc_bslash '\'
    printf -v tc_squote "'"
    printf -v tc_dquote '"'
    printf -v tc_bang   '!'
    printf -v tc_tick   '`'
    printf -v tc_dollar '$'
    printf -v IFS_DEF   ' \t\n'
    printf -v IFS_TN    '\t\t\n'
    printf -v IFS_N     '\n\n\n'
    printf -v IFS_RGX   '|\t\n'
    # Use default IFS
    IFS="${IFS_DEF}"

    # A 'unique'(?) session variable for function.
    rgx_sess="${fnc}_${HOSTNAME:-_}_${UID:-_}_${PPID:-_}_${$:-_}_${SECONDS:-_}_${RANDOM:-_}"

    # Separate args to function into options(opt_*) and arguments(args).
    I=0     # Flag the end of options via '--' argument.
    for tmp in "${@}"
    do
        # If long option (the only kind accepted by this parser) and haven't seen '--'..
        if [[ "${tmp}" == --* && "${I}" -eq 0 ]]
        then
            # If option ender..
            if [[ "${tmp}" == -- ]]
            then
                # Set end-of-options flag and go to next argument.
                I=1
                continue
            fi
            # Remove '--' from option name.
            tmp="${tmp#--}"
            # If valid option name..
            if [[ " ${opts_valid[*]} " =~ ${tc_spc}${tmp%%=*}${tc_spc} ]]
            then
                # Assign '1' to simple options.
                [[ "${tmp}" == *=* ]] || tmp="${tmp}=1"
                # Set 'opt_*' variable based on provided option.
                printf -v tmp -- 'opt_%s=%q' "${tmp%%=*}" "${tmp#*=}"
                eval "${tmp}"
                # Next argument.
                continue
            fi
        fi
        # This is an argument, so add to arguments array.
        args[${#args[@]}]="${tmp}"
    done
    opt=
    tmp=
    I=

    # Create eval-ready (escaped/quoted) array of arguments.
    eargs=( "${args[@]}" )
    for (( I=0; I<${#eargs[@]}; I++ ))
    do
        printf -v tmp '%q' "${eargs[${I}]}"
        # If argument doesn't need escaping, then use simple (unescaped/unquoted).
        [[ "${tmp}" =~ \\ ]] || continue
        eargs[${I}]="${tmp}"
        # If arg is an eval string { $'' }, then use that.
        [[ ! "${tmp}" =~ ^\$${tc_squote}.*${tc_squote}$ ]] || continue
        # If arg doesn't contain single-quote(s), then just quote in single-quotes.
        [[ "${tmp}" =~ ${tc_squote} ]] || {
            eargs[${I}]="'${args[${I}]}'"
            continue
        }
        # Arg contains single-quote(s)..
        tmp="${args[${I}]}"
        # So if it also contains a '!', then single-quote everything but the single-quotes, which get double-quoted.
        # This is so that re-using the args in an interactive shell won't trigger history macros.
        if [[ "${tmp}" == *${tc_bang}* ]]
        then
            tmp="${tmp//${tc_squote}/${tc_squote}${tc_dquote}${tc_squote}${tc_dquote}${tc_squote}}"
            tmp="'${tmp}'"
            tmp="${tmp//${tc_squote}${tc_squote}}"
            eargs[${I}]="${tmp}"
            continue
        fi
        # Otherwise escape eval chars and double-quotes in string, then enclose in double-quotes.
        tmp="${tmp//${tc_dquote}/${tc_bslash}${tc_dquote}}"
        tmp="${tmp//${tc_dollar}/${tc_bslash}${tc_dollar}}"
        tmp="${tmp//${tc_tick}/${tc_bslash}${tc_tick}}"
        eargs[${I}]="${tc_dquote}${tmp}${tc_dquote}"
    done
    tmp=
    I=

    # Set 'dbg' equal to 'opt_debug'
    dbg="${opt_debug:-0}"

    # Flag standard file descriptors as open (or not).
    [[ ! -t 0 ]] || flg_file0=1
    [[ ! -t 1 ]] || flg_file1=1
    [[ ! -t 2 ]] || flg_file2=1

    # BASH_FUNCTION_INIT # SETUP # DO NOT TOUCH # }}}

    # BASH_FUNCTION_INIT # FUNCTION # YOUR CODE HERE # START

    # bash_function_init_dump_vars {{{

    function bash_function_init_dump_vars ()
    {

        declare \
            ___bash_function_init_dump_vars___tmps \
            ___bash_function_init_dump_vars___tmp

        for ___bash_function_init_dump_vars___tmp in ${vars____[*]}
        do
            ___bash_function_init_dump_vars___tmps=(
                ${___bash_function_init_dump_vars___tmp}
                "$( declare -p "${___bash_function_init_dump_vars___tmp}" )"
            )
            [[ "${___bash_function_init_dump_vars___tmps[1]}" =~ ^declare${tc_spc}-([^[:blank:]]*) ]] || continue
            if [[ "${BASH_REMATCH[1]}" == *a* ]]
            then
                printf \
                        'declare -%s %s=(' "${BASH_REMATCH[1]}" \
                        "${___bash_function_init_dump_vars___tmp}"
                printf \
                        -v ___bash_function_init_dump_vars___tmp \
                        '___bash_function_init_dump_vars___tmps=( "${%s[@]}" )' \
                        "${___bash_function_init_dump_vars___tmp}"
                eval "${___bash_function_init_dump_vars___tmp}"
                for ___bash_function_init_dump_vars___tmp in "${___bash_function_init_dump_vars___tmps[@]}"
                do
                    printf ' %q' "${___bash_function_init_dump_vars___tmp}"
                done
                [[ "${#___bash_function_init_dump_vars___tmps[@]}" -eq 0 ]] || printf ' '
                printf ')\n'
                continue
            fi
            printf 'declare -%s %s=' "${BASH_REMATCH[1]}" "${___bash_function_init_dump_vars___tmp}"
            printf \
                    -v ___bash_function_init_dump_vars___tmp \
                    '___bash_function_init_dump_vars___tmp="${%s}"' \
                    "${___bash_function_init_dump_vars___tmp}"
            eval "${___bash_function_init_dump_vars___tmp}"
            printf '%q\n' "${___bash_function_init_dump_vars___tmp}"
        done

    }

    # }}}

    bash_function_init_dump_vars

    # BASH_FUNCTION_INIT # FUNCTION # YOUR CODE HERE # FINISH

    # BASH_FUNCTION_INIT # EXIT # DO NOT TOUCH # {{{

    # Return the value of 'fnc_return' variable.
    return "${fnc_return}"

    # BASH_FUNCTION_INIT # EXIT # DO NOT TOUCH # }}}

}

bash_function_init "${@}"
