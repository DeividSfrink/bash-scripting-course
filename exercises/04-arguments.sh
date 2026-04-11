#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 04-arguments.sh
# Description: Demonstrates how to pass data into a script via
#              command-line arguments (Positional Parameters).
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# ARGUMENTS GUIDE
# ------------------------------------------------------------------
# VARIABLE | DESCRIPTION
# ---------|--------------------------------------------------------
# $0       | The name of the script itself.
# $1 - $9  | The first through ninth arguments passed to the script.
# $#       | The total number of arguments passed.
# $@       | All the arguments as a single list.
# ------------------------------------------------------------------

echo "--- Script Execution Report ---"
echo "Script Name ($0): $0"
echo "First Argument ($1): $1"
echo "Second Argument ($2): $2"
echo "Total Count of Arguments ($#): $# items"
echo "Full List of Arguments ($@): $@"
echo "---------------------------------------------------"

# Real World Example: A simple user creator logic
if [ $# -lt 2 ]; then
    echo "Usage: ./04-arguments.sh [Username] [ID]"
    echo "Example: ./04-arguments.sh Deivid 1001"
else
    echo "User profile for $1 created with ID: $2."
fi
