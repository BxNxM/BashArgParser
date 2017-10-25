#!/bin/bash

# get arg list pcs
args_pcs=$#
# get arg list
arg_list=($@)

# ------------------- SET ARG PARSER ----------------#
function init() {
    #__________________________!!!!!!!!!___________________________#
    ########################## SET THESE ###########################
    known_args=("man" "debug" "example" "example2")                             # valid arg list - add new args - call with -- expl: --man
    known_args_args=(0 0 2 1)                                                   # values for args - expl: --man -> 0, --example -> 1 etc.
    man_for_args=("--man\t\t::\tmanual"\                                        # add help text here
                  "--example\t::\texample for usage,  ${known_args_args[2]} par"\
                  "--example2\t::\tother example for usage, ${known_args_args[3]} par")
    #______________________________________________________________#
    ################################################################
    args_value=()
    args_value_value=()
    error_happened=0

    for init_value in "${known_args[@]}"
    do
        # set value to one
        args_value+=("0")
        args_value_value+=("")
    done
}

#--- VALIDATE LISTS SYNCRON & ERRORS & ARG VALUES ---#
function validate() {

    if [[ "${args_value_value[*]}" == *"--"* ]] || [ "$error_happened" -eq 1 ]
    then
        echo -e "[!!!] args error, use --man for more info."
        exit 400
    fi

    if [ "${#known_args[@]}" -ne "${#known_args_args[@]}" ]
    then
        echo -e "[!!!] config error, known_args len and known_args_args len is not equel!"
        exit 401
    fi

    validcommandwasfind=0
    for iscalled in ${args_value[@]}
    do
        validcommandwasfind=$((validcommandwasfind+iscalled))
    done
    if [ "$validcommandwasfind" -eq 0 ] && [ "$args_pcs" -gt 0 ]
    then
        echo -e "[!!!] valid arg not find, use --man for more info."
        exit 402
    fi
}

# ----------------- ARG PARSER CORE ----------------#
function arg_parse() {
    error_happened=0
    for((i=0;i<"${#arg_list[@]}";i++))
    do
        for((k=0;k<"${#known_args[@]}";k++))
        do
            buffer=""
            case "${arg_list[$i]}" in
                "--${known_args[$k]}")
                    # set value to one
                    args_value[$k]="1"
                    args_max=$((i + ${known_args_args[$k]} + 1))
                    #echo -e "arg max: $args_max"
                    if [ ${#arg_list[@]} -eq $args_max -o ${#arg_list[@]} -gt $args_max ]
                    then
                        for((args_val="$((i+1))"; args_val<="$i"+"${known_args_args[$k]}"; args_val++))
                        do
                            buffer+="${arg_list["$args_val"]} "
                        done
                        args_value_value[$k]="$buffer"
                    else
                        echo -e "${arg_list[$i]} arg required ${known_args_args[$k]} parameter, $((${known_args_args[$k]}+args_pcs-args_max)) were given"
                        error_happened=1
                        args_value[$k]="0"
                    fi
                    # debug message
                    Message="ARGS METCHED: ${arg_list[$i]} <=> ${known_args[$k]}"
                    ;;
            esac
        done
    done
}

# ------------------- GET STATUS FOR ARG -------------#
function get_arg_status() {
    key="$1"
    for((index=0;index<"${#known_args[@]}";index++))
    do
        if [ "$key" == "${known_args["$index"]}" ]
        then
            echo "${args_value["$index"]}"
        fi
    done
}

# ---------------- GET VALUE(S) FOR ARG ---------------#
function get_arg_value() {
    key="$1"
    for((index=0;index<"${#known_args[@]}";index++))
    do
        if [ "$key" == "${known_args["$index"]}" ]
        then
            echo "${args_value_value["$index"]}"
        fi
    done
}

# ---------------------- MAN PAGE --------------------#
function man() {
    if [ $(get_arg_status "man") -eq 1 ]
    then
        for manpage in "${man_for_args[@]}"
        do
            echo -e "$manpage"
        done
    fi
}

function debug_print() {
    echo -e "KNOWN ARGS: ${known_args[*]}   :::   known arguments"
    echo -e "KNOWN ARGS ARGS: ${known_args_args[*]}      :::   known args reguired parameters pieces"
    echo -e "ARGS VALUE: ${args_value[*]}           :::   args status, is colled?"
    echo -e "ARGS VALUE VALUE: ${args_value_value[*]}   :::   args reguired read parameters"
}

# ------------------- MAIN FUNCTION -------------------#
function argParseRun() {
    init
    arg_parse
    validate
    if [ $(get_arg_status "debug") -eq 1 ]
    then
        debug_print
    fi
    man
}

#:::::::::::::::::::: MAIN USAGE ::::::::::::::::::::::
function demo() {
    # run argparser
    argParseRun

    # check arg was called
    if [ $(get_arg_status "example") -eq 1 ]
    then
        # get required arg values
        echo -e "example was called with parameters: $(get_arg_value "example")"
    fi

    # check arg was called
    if [ $(get_arg_status "example2") -eq 1 ]
    then
        # get required arg values
        echo -e "example3 was called with parameters: $(get_arg_value "example2")"
    fi
}

# call if demo active
#demo
