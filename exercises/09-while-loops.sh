#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 07-while-loops.sh
# Description: Demonstrates how to repeat commands as long as a 
#              condition remains true.
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# WHILE LOOP GUIDE
# ------------------------------------------------------------------
# SYNTAX                  | DESCRIPTION
# ------------------------|-----------------------------------------
# while [ condition ]     | Keep running as long as condition is TRUE.
# do ... done             | The block of code to repeat.
# ((counter++))           | Modern Bash way to increment a number.
# break                   | Exit the loop immediately.
# continue                | Skip current step and go to the next loop.
# ------------------------------------------------------------------
# RELEVANT COMMANDS:
# read -p "Prompt"        | Displays message and waits for input.
# read -s                 | Silent mode (hides typing, e.g., passwords).
# ------------------------------------------------------------------
# PRO TIP: Be careful with 'Infinite Loops'! If your condition never
# becomes false, the script will run forever. Use 'Ctrl + C' to kill
# a script that is stuck in a loop.
# ------------------------------------------------------------------

# 1. The Basic Counter
echo "--- 1. Simple Counter ---"
counter=1

while [ $counter -le 5 ]
do
    echo "Current count: $counter"
    # We must change the variable so the loop eventually ends
    ((counter++))
    sleep 0.5 # Pause for half a second
done
echo "Blast off!"
echo "---------------------------------------------------"

# 2. Input Validation (The "Keep Asking" Loop)
echo "--- 2. User Input Validation ---"
# We start with an empty variable
secret=""

# We use 'read -p' here so the user sees the question and typing on one line
while [ "$secret" != "bash" ]
do
    read -p "Enter the secret word to stop this loop: " secret
    
    if [ "$secret" != "bash" ]; then
        echo "❌ Wrong! Hint: It's the name of this shell."
    fi
done

echo "✅ Correct! Access granted."
echo "---------------------------------------------------"

# 3. Reading a File Line-by-Line
# This is the most professional use of a 'while' loop.
echo "--- 3. Reading File Contents ---"

# Let's create a temporary list
echo "Server_01" > servers.txt
echo "Server_02" >> servers.txt
echo "Server_03" >> servers.txt

line_num=1
# 'read -r' reads the file content into the 'line' variable
while read -r line
do
    echo "Pinging $line (Line #$line_num)... Done."
    ((line_num++))
done < servers.txt # We feed the file into the loop here

# Clean up
rm servers.txt
echo "---------------------------------------------------"

# 4. An Infinite Loop with a 'Break'
echo "--- 4. Infinite Loop with Break ---"
echo "Starting system monitor (will stop at 3)..."

timer=1
while true
do
    echo "System heartbeat... $timer"
    if [ $timer -eq 3 ]; then
        echo "Threshold reached. Breaking loop."
        break # This kills the loop instantly
    fi
    ((timer++))
    sleep 1
done

echo "Script exercise finished!"
