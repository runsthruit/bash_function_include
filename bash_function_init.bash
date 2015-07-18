#! /bin/bash

function bash_function_init ()
{

    # BASH_FUNCTION_INIT # INIT # YOUR CODE HERE # START

    # Pickup the last command exit code.
    # Don't put *ANYTHING* before this in your function.
    # Otherwise, you will lose the ability to store the previous return value.
    # Will add it to vars_il_ and vars____ later on, so it doesn't get erased.
    declare -ir pre_return=${?}

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
    # Local and Global (Arrays may not be exported)
    vars_al_=()
    vars_ag_=()
    # Additions to integer variables go here.
    # Local and Global (Integers are not exported with integer type intact)
    vars_il_=()
    vars_ig_=()

    # BASH_FUNCTION_INIT # INIT # YOUR CODE HERE # FINISH

    # BASH_FUNCTION_INIT # INIT # MY CODE HERE # START

    # Additions to opts_valid go here.
    opts_valid=(
    #my_opt     # Valid option for this function.
    install     # Remove any extant init code, and install like new.
    output      # Output to provided path instead of source file.
    dryrun      # Show what would be done, with no prompts for further info.
    force       # Use defaults, even if to point of error, avoiding prompts.
    )

    # Additions to string variables go here.
    # Local, Local-export, Global, Global-export
    vars_sl_=(
    #my_var                 # Some variable for this funciton.
    src_init                # Path of init source file.
    src_init_src            # Source of init source file.
    src_file                # Source file with function[s] to install/update into.
    src_file_src            # Source code with function[s] to install/update into.
    src_file_fnc            # Function code, for processing.
    src_file_fnc_nam        # Function name.
    src_file_fnc_pad        # Function padding.
    tgt_file                # Target file with function[s] installed/updated.
    tgt_file_src            # Target code with function[s] installed/updated.
    src_fnc                 # Function and its line-num to process in source file.
    tmp_d                   # Directory to use for temporary files.
    tmp_f                   # File to use for intermediate states of source.
    seg_code_init_ych       # Personal setup code template.
    seg_code_setup_dnt      # Setup code segment.
    seg_code_main_ych       # Personal function code template.
    seg_code_exit_dnt       # Exit code segment.
    seg_code_exec_dnt       # Exec code segment.
    rgx_code_fnc            # Regex to find a function.
    rgx_code_seg            # Iterator of regexs to find code segments.
    )
    vars_slx=()
    vars_sg_=()
    vars_sgx=()
    # Additions to array variables go here.
    # Local and Global (Arrays may not be exported)
    vars_al_=(
    src_files               # Source files with function[s] to install/update into.
    src_file_fnc_nams       # Function[s] processed in source file.
    rgx_code_segs           # Regexs to find code segments.
    rgx_code_segs_bases     # Bases strings to use in constructing regexs.
    )
    vars_ag_=()
    # Additions to integer variables go here.
    # Local and Global (Integers are not exported with integer type intact)
    vars_il_=(
    src_init_line   # Line number bash_function_init was found on.
    flg_code_fnd    # Flag noting segment code was found in function 
    flg_code_ins    # Flag noting segment code is to be inserted 
    flg_code_upd    # Flag noting segment code is to be updated.
    flg_file_dif    # Flag noting source has been modified.
    flg_file_upd    # Flag noting source file is to be updated.
    err_noinit      # Error: Init source file not found/readable.
    err_conout      # Error: Output file provided, but multiple sources provided.
    err_badout      # Error: Output file provided, but unable to write.
    err_badtmp      # Error: Temporary dir/file uanble to be written.
    err_badseg      # Error: Could not load code segment.
    err_nostdi      # Error: No input provided on STDIN.
    err_nofile      # Error: Input file not found.
    err_nrfile      # Error: Input file cannot be read.
    err_nmstdi      # Error: No STDIN input when using multiple files.
    )
    vars_ig_=()

    # BASH_FUNCTION_INIT # INIT # MY CODE HERE # FINISH

    # BASH_FUNCTION_INIT # SETUP # DO NOT TOUCH # {{{

    # Special variable for setting valid options names.
    # This variable will be added to vars_al_ and vars____ later on.
    local opts_valid=(
    help    # Flag for common help option.
    debug   # Debug level.
    ${opts_valid[*]}
    )

    # Default local strings.
    local vars_sl_=(
    fnc         # Shorthand for function name.
    fnctag      # All-caps version of function name.
    dbg         # Debug level of function, allowing non-integer value.
    ent         # Default temporary variable for array iteration.
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
    local vars_slx=( ${vars_slx[*]} )
    # Default global strings.
    local vars_sg_=( ${vars_sg_[*]} )
    # Default global export strings.
    local vars_sgx=( ${vars_sgx[*]} )

    # Default arrays.
    local vars_al_=(
    opts_invalid    # List of invalid options supplied, if any.
    args            # Array of function args, with options removed.
    eargs           # Quoted/Sanitized/Pretty args for eval/debug/print.
    tmps            # Default temporary array.
    ${vars_al_[*]}
    )
    local vars_alx=( ${vars_alx[*]} )
    local vars_ag_=( ${vars_ag_[*]} )
    local vars_agx=( ${vars_agx[*]} )

    # Default integers.
    # Btw, I don't know how to create global integer vars. =]
    local vars_il_=(
    fnc_return  # Return value for this function.
    I J K       # Common iterators.
    flg_file0   # STDIN  is open?
    flg_file1   # STDOUT is open?
    flg_file2   # STDERR is open?
    ${vars_il_[*]}
    )
    local vars_ilx=( ${vars_ilx[*]} )

    # Collect variables to be exported.
    local vars___x=(
    ${vars_slx[*]} ${vars_sgx[*]}
    ${vars_alx[*]} ${vars_agx[*]}
    ${vars_ilx[*]}
    )
    # Collect all variables, mostly for reporting/debug.
    local vars____=(
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
    for tmp in ${vars_sl_[*]} ${vars_slx[*]}; do local    ${tmp}; done
    # Localize array variables.
    for tmp in ${vars_al_[*]} ${vars_alx[*]}; do local -a ${tmp}; done
    # Localize integer variables and set (to zero).
    for tmp in ${vars_il_[*]} ${vars_ilx[*]}; do local -i ${tmp}; eval "${tmp}="; done
    # Export appropriate variables.
    for tmp in ${vars___x[*]}; do export ${tmp}; done
    # Collection of export variables is no longer needed.
    unset vars___x
    tmp=

    # Add opts_valid to variable collections.
    vars_al_=( opts_valid ${vars_al_[*]} )
    vars____=( opts_valid ${vars____[*]} )
    # Add pre_return to variable collections.
    if [[ -n "${pre_return}" ]]; then
        vars_il_=( pre_return ${vars_il_[*]} )
        vars____=( pre_return ${vars____[*]} )
    fi

    # Set function name variable.
    fnc="${FUNCNAME[0]}"
    # Set default function return value.
    fnc_return=0

    # Determine all-caps debug variable name for function and function tag.
    tmp="DEBUG_${fnc}"
    tmps=( {a..z} {A..Z} )
    for (( I=0; I<26; I++ ))
    do
        tmp="${tmp//${tmps[${I}]}/${tmps[$((I+26))]}}"
    done
    # Set function tag variable.
    fnctag="${tmp#DEBUG_}"
    # Set 'dbg' to environment debug level value.
    # Triple-'}' messes with vim folding, so crappy fix is to break this apart.
    printf -v tmp 'dbg="${%s:-${%s:-}}"' "${tmp}" "${tmp#DEBUG_}_DEBUG"
    eval "${tmp}"
    printf -v tmp 'dbg="${dbg:-${DEBUG:-}}"'
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
        if [[ "${tmp}" == --* && "${I}" -eq 0 ]]; then
            # If option ender..
            if [[ "${tmp}" == -- ]]; then
                # Set end-of-options flag and go to next argument.
                I=1
                continue
            fi
            # Remove '--' from option name.
            tmp="${tmp#--}"
            # If valid option name..
            if [[ " ${opts_valid[*]} " =~ ${tc_spc}${tmp%%=*}${tc_spc} ]]; then
                # Assign '1' to simple options.
                [[ "${tmp}" == *=* ]] || tmp="${tmp}=1"
                # Set 'opt_*' variable based on provided option.
                printf -v tmp -- 'opt_%s=%q' "${tmp%%=*}" "${tmp#*=}"
                eval "${tmp}"
            else
                # Add to arguments array, can be excluded in comp to opts_invalid.
                args[${#args[@]}]="${tmp}"
                # If not valid option name, add to invalid list.
                tmp="${tmp%%=*}"
                opts_invalid[${#opts_invalid[@]}]="${tmp}"
            fi
            # Next argument.
            continue
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
        if [[ ! "${tmp}" =~ ${tc_squote} ]]; then
            eargs[${I}]="'${args[${I}]}'"
            continue
        fi
        # Arg contains single-quote(s)..
        tmp="${args[${I}]}"
        # So if it also contains a '!', then single-quote everything but the single-quotes, which get double-quoted.
        # This is so that re-using the args in an interactive shell won't trigger history macros.
        if [[ "${tmp}" == *${tc_bang}* ]]; then
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
    dbg="${dbg:-${opt_debug:-0}}"

    # Flag standard file descriptors as open (or not).
    [[ ! -t 0 ]] || flg_file0=1
    [[ ! -t 1 ]] || flg_file1=1
    [[ ! -t 2 ]] || flg_file2=1

    # BASH_FUNCTION_INIT # SETUP # DO NOT TOUCH # }}}

    # BASH_FUNCTION_INIT # MAIN # MY CODE HERE # START

    exec 3>&1

    # Set error code variables.
    err_noinit=11
    err_conout=12
    err_badout=13
    err_badtmp=14
    err_badseg=15
    err_nostdi=16
    err_nofile=17
    err_nrfile=18
    err_nmstdi=19

    # Regex patterns for parsing source.
    printf -v rgx_code_fnc \
        '%s' \
        '^(.*'"${tc_nln}"')' \
        '(' \
            '(' \
                '(' \
                    '(function[[:blank:]]+)' \
                    '([^[:blank:]}{\)\(]+)' \
                    '([[:space:]]*\([[:blank:]]*\))?' \
                ')' \
                '|' \
                '(' \
                    '([[:blank:]]*)' \
                    '([^[:blank:]}{\)\(]+)' \
                    '([[:space:]]*\([[:blank:]]*\))' \
                ')' \
            ')' \
            '([[:space:]]*)*' \
            '({[[:blank:]]*'"${tc_nln}"'+)' \
            '([[:blank:]]+)' \
            '(.*)' \
            '('"${tc_nln}"'[[:blank:]]*})' \
        ')' \
        '('"${tc_nln}"'.*)*$'
    rgx_code_segs_bases=(
    '# BASH_FUNCTION_INIT #'
    '# DO NOT TOUCH'
    '# YOUR CODE HERE'
    '# ({{''{|START)'
    '# (}}''}|FINISH)'
    '# INSERT'
    'INIT:init:ych'
    'SETUP:setup:dnt'
    'MAIN:main:ych'
    'EXEC:exec:dnt'
    )

    # Initial processing of source files provided.
    {
        src_files=( "${args[@]}" )
        if [[ "${#src_files[@]}" -eq 0 ]]; then
            if [[ "${flg_file0}" -eq 0 ]]; then
                src_files=( '-' )
            else
                opt_help=1
            fi
        elif [[ "${#src_files[@]}" -gt 1 ]]; then
            if [[ -n "${opt_output}" ]]; then
                printf "${fnc}: ERROR: %s\n" \
                    "Cannot specify output when providing multiple source files."
                return "${err_conout}"
            fi
            for src_file in "${src_files[@]}"; do
                if [[ "${src_file}" == "-" ]]; then
                    printf "${fnc}: ERROR: %s\n" \
                        "Cannot accept STDIN input when providing multiple source files."
                    return "${err_nmstdi}"
                fi
            done
        fi
    } 1>&2

    # Display help and possibly invalid options provided.
    {
        if [[ "${opt_help}" -ne 0 || "${#opts_invalid[@]}" -ne 0 ]]; then

            if [[ "${#opts_invalid[@]}" -ne 0 ]]; then

                echo INVALID

            fi

            echo HELP

        fi
    } 1>&2

    # Setup and test temporary directory.
    {
        tmp_d="${TMPDIR:-/tmp}/${rgx_sess}"
        tmp_f="${tmp_d}/tmp_file"
        if [[ ! -d "${tmp_d}/." || ! -r "${tmp_d}/." || ! -x "${tmp_d}/." ]]; then
            mkdir -p "${tmp_d}"
        fi
        if [[ ! -d "${tmp_d}/." || ! -r "${tmp_d}/." || ! -x "${tmp_d}/." ]]; then
            printf "${fnc}: ERROR: %s\n" "Could not create/read temporary directory. { ${tmp_d} }"
            return "${err_badtmp}"
        fi
        touch "${tmp_f}"
        if [[ ! -e "${tmp_f}" ]]; then
            printf "${fnc}: ERROR: %s\n" "Could not create temporary file. { ${tmp_f} }"
            return "${err_badtmp}"
        fi
        command rm -f "${tmp_f}"
    } 1>&2

    # Locate init source.
    {
        src_init="$( shopt -s extdebug; declare -F "${fnc}"; shopt -u extdebug )"
        if [[ "${src_init}" =~ ^([^${tc_spc}]+)[${tc_spc}]+([^${tc_spc}]+)[${tc_spc}]+(.*)$ ]]; then
            src_init_line="${BASH_REMATCH[2]}"
            src_init="${BASH_REMATCH[3]}"
            if [[ ! -r "${src_init}" ]]; then
                printf "${fnc}: ERROR: %s\n" "Could not read source. { ${src_init} }"
                return "${err_noinit}"
            fi
        else
            printf "${fnc}: ERROR: %s\n" "Could not determine source. { ${src_init} }"
            return "${err_noinit}"
        fi
    } 1>&2

    # Load init source into code segment variables.
    {
        for (( I=6; I<${#rgx_code_segs_bases[@]}; I++ ))
        do
            tmp="${rgx_code_segs_bases[${I}]}"
            [[ "${tmp}" =~ (.*):(.*):(.*) ]]
            [[ "${BASH_REMATCH[3]}" == "dnt" ]] && J=1 || J=2
            printf -v tmp \
                '%s' \
                '^(.*'"${tc_nln}"')' \
                '(' \
                    '[[:blank:]]*'"${rgx_code_segs_bases[0]}" \
                    " ${BASH_REMATCH[1]}" \
                    '(' \
                        "( ${rgx_code_segs_bases[${J}]})" \
                        "([^${tc_nln}]*[${tc_nln}])*" \
                        '[[:blank:]]*'"${rgx_code_segs_bases[0]}" \
                        " ${BASH_REMATCH[1]}" \
                        " ${rgx_code_segs_bases[${J}]}" \
                    '|' \
                        "( ${rgx_code_segs_bases[${J}]})?" \
                        "( ${rgx_code_segs_bases[5]})" \
                    ')' \
                    "([^${tc_nln}]*)" \
                ')' \
                '(.*)$'
            rgx_code_segs[$((I-6))]="seg_code_${BASH_REMATCH[2]}_${BASH_REMATCH[3]}:${tmp}"
        done
        tmp="$(<"${src_init}")${tc_nln}"
        for (( I=0; I<${#rgx_code_segs[@]}; I++ ))
        do
            [[ "${rgx_code_segs[${I}]}" =~ ^([^:]*):(.*)$ ]]
            tmps=( "${BASH_REMATCH[@]:1}" )
            if [[ "${tmp}" =~ ${tmps[1]} ]]; then
                printf -v "${tmps[0]}" '%s' "${BASH_REMATCH[2]}"
            else
                printf "${fnc}: ERROR: Could not load code segment { %s }!\n" "${tmps[0]#seg_code_}"
                return "${err_badseg}"
            fi
        done
        I=
        J=
        rgx=
        tmp=
        tmps=()
    } 1>&2

    # Iterate through source files and operate on appropriately.
    {

        for src_file in "${src_files[@]}"; do

            if [[ "${src_file}" == "-" ]]; then
                printf "\n${fnc}: %s\n" "Processing STDIN"
                if [[ "${flg_file0}" -eq 1 ]]; then
                    printf "${fnc}: ERROR: %s\n" "STDIN input not found!"
                    return "${err_nostdi}"
                fi
            else
                printf "${fnc}: Processing file { %s }\n" "${src_file}"
                if [[ ! -e "${src_file}" ]]; then
                    printf "${fnc}: ERROR: %s\n" "File not found { ${src_file} }!"
                    return "${err_nofile}"
                fi
                if [[ ! -r "${src_file}" ]]; then
                    printf "${fnc}: ERROR: %s\n" "Cannot read file { ${src_file} }!"
                    return "${err_nrfile}"
                fi
            fi
            src_file_src="$( cat "${src_file}" )"
            tgt_file_src=
            tgt_file="${opt_output:-${src_file:--}}"

            while [[ "${src_file_src}" =~ ${rgx_code_fnc} ]]; do
                src_file_src="${BASH_REMATCH[1]}"
                src_file_fnc="${BASH_REMATCH[2]}"
                src_file_fnc_nam="${BASH_REMATCH[6]:-${BASH_REMATCH[10]}}"
                src_file_fnc_pad="${BASH_REMATCH[14]}"
                tgt_file_src="${BASH_REMATCH[17]}${tgt_file_src}"
                printf "${fnc}: %s\n" "Processing function { ${src_file_fnc_nam} }"
                flg_code_fnd=0
                for rgx_code_seg in "${rgx_code_segs[@]}"; do
                    flg_code_ins=0
                    flg_code_upd=0
                    tmp="${rgx_code_seg%%:*}"
                    rgx="${rgx_code_seg#*:}"
                    if [[ "${src_file_fnc}" =~ ${rgx} ]]; then
                        printf "${fnc}: %s\n" "Identified segment { ${tmp#seg_code_} }"
                        flg_code_fnd=1
                        if [[ "${tmp}" == *_dnt ]]; then flg_code_upd=1; fi
                        if [[ "${BASH_REMATCH[7]}" == *${rgx_code_segs_bases[5]} ]]; then flg_code_ins=1; fi
                        if [[ "${flg_code_ins}" -gt 0 || "${flg_code_upd}" -gt 0 ]]; then
                            if [[ "${flg_code_ins}" -gt 0 ]]; then
                                printf "${fnc}: %s\n" "Inserting segment { ${tmp#seg_code_} }"
                            else
                                printf "${fnc}: %s\n" "Updating segment { ${tmp#seg_code_} }"
                            fi
                            printf -v tmp 'tmp="${%s}"' "${tmp}"
                            eval "${tmp}"
                            printf -v src_file_fnc \
                                '%s' \
                                "${BASH_REMATCH[1]}" \
                                "${tmp}" \
                                "${BASH_REMATCH[9]}"
                        fi
                    fi
                done
                tgt_file_src="${src_file_fnc}${tgt_file_src}"
            done
            tgt_file_src="${src_file_src}${tgt_file_src}"

            printf '%s\n' "${tgt_file_src}" > "${tmp_f}"
            flg_file_dif=0
            flg_file_skp="${opt_dryrun:-0}"
            flg_file_upd="${opt_force:-0}"
            if [[ "${src_file}" == '-' ]]; then
                flg_file_dif=1
                flg_file_upd=1
            else
                command diff -EZBbw -q "${src_file}" "${tmp_f}" >/dev/null 2>&1
                [[ "${?}" -eq 0 ]] || flg_file_dif=1
            fi
            if [[ "${flg_file_dif}" -eq 0 ]]; then
                printf "${fnc}: %s\n" "No changes to source file."
            else
                if [[ "${flg_file0}" -eq 1 && "${flg_file_upd}" -eq 0 ]]; then
                    read -p "${fnc}: Source updated, view diff [y/N]? " tmp
                    if [[ "${tmp}" == [Yy]* ]]; then
                        diff -EZBbw -W ${COLUMNS:-160} -y "${src_file}" "${tmp_f}" | "${PAGER:-less -isR}"
                    fi
                    read -p "${fnc}: Update original source file [y/N]? " tmp
                    if [[ "${tmp}" == [Yy]* ]]; then
                        flg_file_upd=1
                    else
                        flg_file_skp=1
                    fi
                fi
                if [[ "${flg_file_skp}" -gt 0 ]]; then
                    printf "${fnc}: %s\n" "Not updating source file, per request."
                elif [[ "${flg_file_upd}" -gt 0 ]]; then
                    if [[ "${src_file}" == '-' ]]; then
                        cat "${tmp_f}" 1>&3
                    else
                        command cp -vf "${tmp_f}" "${tgt_file}"
                    fi
                else
                    printf "${fnc}: %s\n" "Not updating source file."
                fi
            fi

            command rm -f "${tmp_f}"

        done

    } 1>&2

    # Clean up temporary directory.
    {
        command rm -rf "${tmp_d}"
    } 1>&2

    # Return the value of 'fnc_return' variable.
    return "${fnc_return}"

    # BASH_FUNCTION_INIT # MAIN # MY CODE HERE # FINISH

    # BASH_FUNCTION_INIT # MAIN # YOUR CODE HERE # START

    # function bash_function_init_dump_vars {{{

    function bash_function_init_dump_vars ()
    {

        local \
            ___bash_function_init_dump_vars___tmps \
            ___bash_function_init_dump_vars___tmp

        for ___bash_function_init_dump_vars___tmp in ${vars____[*]}
        do
            ___bash_function_init_dump_vars___tmps=(
            ${___bash_function_init_dump_vars___tmp}
            "$( declare -p "${___bash_function_init_dump_vars___tmp}" )"
            )
            [[ "${___bash_function_init_dump_vars___tmps[1]}" =~ ^declare${tc_spc}-([^[:blank:]]*) ]] || continue
            if [[ "${BASH_REMATCH[1]}" == *a* ]]; then
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

    # function bash_function_init_dump_vars }}}

    bash_function_init_dump_vars

    # Return the value of 'fnc_return' variable.
    return "${fnc_return}"

    # BASH_FUNCTION_INIT # MAIN # YOUR CODE HERE # FINISH

}

# BASH_FUNCTION_INIT # EXEC # DO NOT TOUCH # {{{
unset ___tmp
___tmp=( "${BASH_SOURCE[@]}" )
[[ "${___tmp}" != "${0}" && "${#___tmp[@]}" -ne 0 ]] || {
___tmp="${___tmp##*/}"; "${___tmp%.*sh}" "${@}"
exit "${?}"
}
unset ___tmp
return 0
# BASH_FUNCTION_INIT # EXEC # DO NOT TOUCH # }}}
