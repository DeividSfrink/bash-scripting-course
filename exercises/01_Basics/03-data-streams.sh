#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 03-data-streams.sh
# Description: Demonstrates the 3 standard data streams and how
#              to redirect them (Standard Input, Output, and Error).
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# DATA STREAMS GUIDE (Redirection Logic)
# ------------------------------------------------------------------
# SYMBOL       | AFFECTS...            | DESCRIPTION
# -------------|-----------------------|----------------------------
# > or 1>      | Standard Output (1)   | Redirects ONLY successful results.
# 2>           | Standard Error (2)    | Redirects ONLY error messages.
# &>           | Both (1 and 2)        | Redirects everything to one place.
# /dev/null    | The Destination       | A special file that deletes data.
# ------------------------------------------------------------------
# PRO TIP: Use '2> /dev/null' to hide "Permission Denied" errors 
# without hiding the files you actually found!
# ------------------------------------------------------------------

# 1. Standard Output (STDOUT - 1)
# The default output stream for successful commands.
echo "--- 1. Redirecting Success ---"
echo "This message is saved to a file instead of the screen." > output.txt
echo "File created! Contents: $(cat output.txt)"
echo "---------------------------------------------------"

# 2. Standard Error (STDERR - 2)
# The stream for error messages.
echo "--- 2. Redirecting Errors ---"
# This command will fail because the directory doesn't exist
ls /root/no_access 2> error.log
echo "Command failed, but the error was silenced and saved to error.log."
echo "Error found: $(cat error.log)"
echo "---------------------------------------------------"

# 3. The "Black Hole" (/dev/null)
# Use this when you want to ignore output entirely.
echo "--- 3. Using /dev/null ---"
echo "Searching /etc (All errors will be deleted)..."
find /etc -type f 2> /dev/null | head -n 3
echo "---------------------------------------------------"

# 4. Redirecting Both (&>)
# Useful for full logs where you want everything in one place.
echo "--- 4. Combined Redirect ---"
ls -l 01-hello-world.sh missing-file.txt &> combined.log
echo "Check combined.log for both success and fail messages."

# Clean up
rm output.txt error.log combined.log
