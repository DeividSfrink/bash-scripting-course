#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 04-if-statements.sh
# Description: Demonstrates 'if' logic and provides a reference
#              for integer vs. string comparison operators.
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# COMPARISON GUIDE
# ------------------------------------------------------------------
# NUMBERS (Integers)         |  STRINGS (Text)
# -----------------------    |  ---------------------------
# -eq  : Equal to            |  ==  : Equal to
# -ne  : Not Equal to        |  !=  : Not Equal to
# -gt  : Greater than        |  -z  : String is Empty
# -lt  : Less than           |  -n  : String is Not Empty
# -ge  : Greater or Equal to |
# -le  : Less or Equal to    |
# ------------------------------------------------------------------
# PRO TIP: Always use -eq/-ne for numbers. Using == on numbers 
# treats "10" and "010" as different, while -eq knows they are equal.
# ------------------------------------------------------------------

# 1. Simple Number Comparison
mynum=200

# Note: -eq means "equal to".
if [ $mynum -eq 200 ]
then
    echo "The condition is true: The number is 200."
else
    echo "The condition is false: The number is NOT 200."
fi

# 2. Multiple Conditions (elif)
# This is how you handle more than two possibilities.
if [ $mynum -gt 300 ]
then
    echo "The number is huge!"
elif [ $mynum -gt 150 ]
then
    echo "The number is medium (greater than 150)."
else
    echo "The number is small."
fi

# 3. Checking if a Directory Exists (-d)
# Useful for checking if folders like /etc or /tmp are available.
if [ -d /usr/bin ]
then
    echo "Success: The /usr/bin directory exists."
else
    echo "Error: Directory not found."
fi

# 4. Checking if a File Exists
# This is one of the most common uses for 'if' in Bash scripting.
# -f checks if a regular file exists.

if [ -f ./02-variables.sh ]
then
    echo "Success: The variables exercise file was found!"
else
    echo "Warning: The variables exercise file is missing."
fi

# 5. Checking if a Command Exists
# We use 'command -v' to see if a program (like 'htop' or 'git') is installed.
if command -v htop
then
    echo "htop is installed, let's run it!"
else
    echo "htop is not installed. You can install it with: sudo apt install htop"
fi
