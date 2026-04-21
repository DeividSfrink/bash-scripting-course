#!/bin/bash

# -------------------------------------------------------------------------
# Script Name: 05-professional-arguments.sh
# Description: Using flags (-u, -f, -v) to make scripts user-friendly.
# -------------------------------------------------------------------------

# -------------------------------------------------------------------------
# THE GETOPTS GUIDE
# -------------------------------------------------------------------------
# getopts "u:f:v" opt
#  - "u:" -> The colon means the flag REQUIRES an argument (e.g., -u Sfrink)
#  - "v"  -> No colon means it's a simple toggle (boolean)
#  - $OPTARG -> Holds the value provided to a flag.
# -------------------------------------------------------------------------

usage() {
    echo "Usage: $0 [-u user] [-f file] [-v]"
    echo "  -u : Specify a username"
    echo "  -f : Specify a configuration file"
    echo "  -v : Enable verbose mode"
    exit 1
}

# If no arguments are provided, show usage
if [ $# -eq 0 ]; then
    usage
fi

# Initialize variables
username="Guest"
filename=""
verbose=false

# The ':' at the start of the string enables "silent error reporting"
# so we can handle errors ourselves in the '?' case.
while getopts ":u:f:v" opt; do
    case $opt in
        u)
            username=$OPTARG
            ;;
        f)
            filename=$OPTARG
            ;;
        v)
            verbose=true
            ;;
        :) # If a flag that requires an argument is missing that argument
            echo "Error: Option -$OPTARG requires an argument."
            usage
            ;;
        \?) # If an unknown flag is passed
            echo "Invalid option: -$OPTARG"
            usage
            ;;
    esac
done

# Shift off the options so $1 now refers to any remaining positional arguments
shift $((OPTIND -1))

# --- Main Logic ---
echo "--- Script Configuration ---"
echo "User: $username"
[ -n "$filename" ] && echo "File: $filename" || echo "File: Not specified"
echo "Verbose Mode: $verbose"
echo "----------------------------"

if [ "$verbose" = true ]; then
    echo "[DEBUG] Process started at $(date)"
    echo "[DEBUG] Remaining positional arguments: $@"
fi

echo "Hello, $username! Script execution finished."
