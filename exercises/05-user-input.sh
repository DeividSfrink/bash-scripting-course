#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 03-user-input.sh
# Description: Demonstrates how to capture and handle data provided 
#              by the user via the keyboard.
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# INPUT REFERENCE GUIDE
# ------------------------------------------------------------------
# FLAG   | DESCRIPTION
# -------|----------------------------------------------------------
# -p     | Prompt: Displays a message before waiting for input.
# -s     | Silent: Hides typing (essential for passwords/API keys).
# -t     | Timeout: Automatically moves on after N seconds.
# -n     | Limit: Stops after the user types N characters.
# ------------------------------------------------------------------
# PRO TIP: Always wrap user-provided variables in double quotes 
# e.g., "$USER_INPUT". This prevents the script from crashing if 
# the user types spaces or leaves the input blank!
# ------------------------------------------------------------------

# 1. Standard Input with Prompt
# -p keeps the cursor on the same line as the question.
read -p "Enter your first name: " first_name
read -p "Enter your age: " age

echo "Hello $first_name! You are $age years old."
echo "---------------------------------------------------"

# 2. Silent Input (Passwords/Secrets)
# -s prevents characters from appearing on the screen.
read -s -p "Enter a secret passcode: " secret_code
echo "" # Required: Moves the terminal to a new line after silent input
echo "Securely stored the secret: $secret_code"
echo "---------------------------------------------------"

# 3. Limited Character Input (One-key press)
# -n 1 tells the script to continue as soon as ONE key is pressed.
echo "Quick Choice: Do you like Bash scripting so far? (y/n)"
read -n 1 user_opinion
echo "" # Drop to new line

if [ "$user_opinion" == "y" ]; then
    echo "That's what I like to hear! 🚀"
else
    echo "Don't worry, it gets better! 🛠️"
fi
echo "---------------------------------------------------"

# 4. Input with a Timeout
# -t 5 will wait exactly 5 seconds. If nothing is typed, it moves on.
echo "Wait! You have 5 seconds to name a fruit or I'll pick one for you."
if read -t 5 -p "Fruit: " fav_fruit; then
    echo "Yum! $fav_fruit is a great choice."
else
    echo ""
    echo "Too slow! My favorite fruit is Apple. 🍎"
fi

echo "---------------------------------------------------"
echo "Input lesson complete!"
