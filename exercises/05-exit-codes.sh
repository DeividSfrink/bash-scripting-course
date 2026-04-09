#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 05-exit-codes.sh
# Description: Demonstrates how commands signal success or failure
#              and provides a reference for standard exit codes.
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# EXIT CODE GUIDE (0 - 255)
# ------------------------------------------------------------------
# CODE    | MEANING
# --------|---------------------------------------------------------
# 0       | Success (Everything went fine)
# 1       | General Error (Catch-all for permissions, missing files)
# 126     | Command found, but NOT executable (Permission issue)
# 127     | Command not found (Typo or PATH issue)
# 130     | Script terminated by user (Ctrl + C)
# 255     | Out of bounds (Exit codes wrap around after 255)
# ------------------------------------------------------------------
# PRO TIP: The special variable $? ALWAYS holds the exit code of the 
# VERY LAST command executed. It overwrites itself instantly, so if 
# you need to save an exit code, assign it to a variable immediately!
# ------------------------------------------------------------------

# 1. A Successful Command (Exit Code 0)
# We mute the output using > /dev/null 2>&1 so it doesn't clutter the screen.
ls /etc/hosts > /dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "Success: The command worked. (Exit code: 0)"
else
    echo "Failure: The command failed."
fi

# 2. A Failed Command (General Error - Exit Code 1)
# Trying to list a directory that doesn't exist.
ls /this/folder/is/fake 2> /dev/null

if [ $? -ne 0 ]
then
    echo "Error: The folder does not exist. (Exit code: 1)"
fi

# 3. Command Not Found (Exit Code 127)
# Trying to run a program that isn't installed or is misspelled.
fake_program_name 2> /dev/null

if [ $? -eq 127 ]
then
    echo "Command Not Found: Check your spelling! (Exit code: 127)"
fi

# 4. Manual Exit Codes
# You can force your script to return a specific code to the OS.
echo "---------------------------------------------------"
echo "Let's test manual exits."
read -p "Type 'error' to fail, or press Enter to succeed: " user_choice

if [ "$user_choice" == "error" ]
then
    echo "Exiting the script with an error..."
    exit 1
else
    echo "Exiting cleanly..."
    exit 0
fi
