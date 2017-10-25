#!/bin/bash

# source arg_parser module
source arg_pargser.bash
# run arg parser
argParseRun

# ||||||||||||||||||||||||||||||||||||||||||||||||| #
#       edit arg_pargser.bash for more/custom       #
#       argument(s) in 12 to 16 lines               #
# ||||||||||||||||||||||||||||||||||||||||||||||||| #

# :::::::::::::::: USE THE RESULT ::::::::::::::::: #
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
    echo -e "example was called with parameters: $(get_arg_value "example2")"
fi
