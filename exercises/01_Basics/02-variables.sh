#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 02-variables.sh
# Description: Demonstrates local variable assignment, string 
#              interpolation, the difference between " " and ' ' and Command Substitution.
# ------------------------------------------------------------------

# 1. Variable Assignment (No spaces around the "=" sign!)
myname="David"      
myage="35"

# 2. String Interpolation (Using variables inside a sentence)
# Double quotes (") allow the shell to "expand" the variable.
echo "Hello, my name is $myname."
echo "I'm $myage years old."

# 3. Bonus: System Variables
echo "The current user is: $USER"
echo "My home directory is: $HOME"

# 4. The "Quoting" Lesson: Double vs. Single Quotes
# Use DOUBLE quotes (") when you want to use a variable.
# Use SINGLE quotes (') when you want to print exactly what you typed.
echo "With double quotes, I see my name: $myname"
echo 'With single quotes, I see the literal text: $myname'

# 5. Variable Re-usability (Efficiency)
# Change the value of "word" once to update all three lines below.
word="fun"

echo "Linux is $word"
echo "Videogames are $word"
echo "Toys are $word"

# 6. Command Substitution (Storing command output in a variable)
# The $(command) syntax runs the command and saves the result.
files=$(ls)
echo "The files in this directory are: $files"

now=$(date)
echo "The system time and date is: $now"
