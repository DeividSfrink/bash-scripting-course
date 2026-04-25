#!/bin/bash

# -------------------------------------------------------------------------
# Script Name: 14-reading-files.sh
# Description: The safe and professional way to process text files.
# -------------------------------------------------------------------------

# -------------------------------------------------------------------------
# WHY 'WHILE READ' INSTEAD OF 'FOR'?
# -------------------------------------------------------------------------
# Beginners often try: for line in $(cat file.txt)
# This is DANGEROUS because it splits the file by spaces, not by lines.
# If a line has "San Francisco", the 'for' loop treats it as two items.
# 'while read' respects the line breaks perfectly.
# -------------------------------------------------------------------------

# Create a dummy data file for the exercise
cat << 'EOF' > users_list.txt
ID:101 | Name:Alice Johnson | Role:Admin
ID:102 | Name:Bob Smith | Role:User
ID:103 | Name:Charlie Brown | Role:Guest
EOF

echo "--- 1. Basic Line-by-Line Reading ---"
# -r  : Prevents backslashes from being interpreted as escape characters.
# <   : Redirects the file into the while loop.

file="users_list.txt"

while read -r line; do
    echo "Processing line: $line"
done < "$file"

echo ""
echo "--- 2. Parsing Specific Columns (The Pro Way) ---"
# We can use IFS (Internal Field Separator) to split the line into 
# variables instantly as we read it.

echo "Extracting just the names and roles:"
while IFS='|' read -r id_part name_part role_part; do
    # Strip the "Name:" and "Role:" prefix for a clean output
    name=${name_part#*:}
    role=${role_part#*:}
    
    echo " -> User:$name is assigned as:$role"
done < "$file"

# 3. Reading from a command output (Process Substitution)
echo ""
echo "--- 3. Reading from a Command Output ---"
echo "Files in your current directory starting with '0':"

ls 0* | while read -r filename; do
    echo " - Found exercise: $filename"
done

# Cleanup
rm users_list.txt

echo ""
echo "---------------------------------------------------"
echo "File reading exercise complete!"
