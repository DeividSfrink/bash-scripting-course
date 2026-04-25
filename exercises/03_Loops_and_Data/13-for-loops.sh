#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 13-for-loops.sh
# Description: Demonstrates how to iterate over lists, ranges, 
#              and file system objects.
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# FOR LOOP GUIDE
# ------------------------------------------------------------------
# SYNTAX                  | DESCRIPTION
# ------------------------|-----------------------------------------
# for item in {1..5}      | Iterates over a range of numbers.
# for item in $list       | Iterates over items in a variable.
# for file in *.txt       | Iterates over files matching a pattern.
# ------------------------------------------------------------------
# PRO TIP: When looping over files, always wrap your variable in 
# quotes (e.g., "$file") to handle filenames that contain spaces!
# ------------------------------------------------------------------

echo "--- 1. Simple Range Loop ---"
# {START..END} is a Bash shortcut for a sequence
for i in {1..5}
do
    echo "Number: $i"
done
echo "---------------------------------------------------"

echo "--- 2. Iterating Over a List ---"
# You can loop over strings directly
for planet in "Mercury" "Venus" "Earth" "Mars"
do
    echo "Exploring $planet..."
done
echo "---------------------------------------------------"

echo "--- 3. Real World: Bulk File Actions ---"
# Let's create some dummy log files
touch test1.log test2.log test3.log

echo "Changing file extensions from .log to .txt..."

# The '*' is a wildcard (globbing)
for file in *.log
do
    # Get the base name and rename
    mv "$file" "${file%.log}.txt"
    echo "Renamed $file to ${file%.log}.txt"
done

# Clean up
rm *.txt
echo "---------------------------------------------------"

echo "--- 4. The 'C-Style' For Loop ---"
# Sometimes you want the traditional programming style
# (Start; Condition; Increment)
for (( i=10; i>0; i-- ))
do
    echo "Countdown: $i"
    sleep 0.2
done
echo "Ignition!"
