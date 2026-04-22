#!/bin/bash

# -------------------------------------------------------------------------
# Script Name: 10-file-conditions.sh
# Description: Using 'if' with flags to check for files and directories.
# -------------------------------------------------------------------------

# Common Flags:
# -e : True if the file/directory exists.
# -f : True if it is a regular file (not a directory).
# -d : True if it is a directory.
# -s : True if the file has a size greater than zero (not empty).
# -r : True if the file is readable by you.
# -w : True if the file is writable by you.

target_file="test_file.txt"

echo "--- Starting File Check for: $target_file ---"

# 1. Check if the file exists at all
if [ -e "$target_file" ]; then
    echo "Check 1: The file '$target_file' exists."
    
    # 2. Check if it's a regular file or a directory
    if [ -f "$target_file" ]; then
        echo "Check 2: This is a regular file."
    elif [ -d "$target_file" ]; then
        echo "Check 2: This is actually a directory, not a file."
    fi

    # 3. Check if the file is empty
    if [ -s "$target_file" ]; then
        echo "Check 3: The file is NOT empty. It has content."
    else
        echo "Check 3: The file is empty."
    fi

    # 4. Check Permissions
    if [ -r "$target_file" ] && [ -w "$target_file" ]; then
        echo "Check 4: You have both read and write permissions."
    fi

else
    echo "Check 1: The file '$target_file' does not exist."
    echo "Creating the file now..."
    touch "$target_file"
    echo "File created. Run the script again to see the difference!"
fi

echo "--- Check Complete ---"
