#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 11-case-statements.sh
# Description: Demonstrates how to use case statements for multi-option
#              logic and simple menu systems, powered by a while loop.
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# CASE STATEMENT GUIDE
# ------------------------------------------------------------------
# SYNTAX                  | DESCRIPTION
# ------------------------|-----------------------------------------
# case $VAR in            | Start the case block based on a variable.
#    pattern)             | The value you are looking for.
#       commands ;;       | The actions to take (MUST end with ;;).
#    *)                   | The "Default" or "Else" catch-all.
# esac                    | The end of the case block ('case' backwards).
# ------------------------------------------------------------------
# PRO TIP: Case statements are perfect for building CLI menus or 
# processing command-line arguments like --start or --stop.
# ------------------------------------------------------------------

echo "--- 1. The Professional Menu (Interactive Loop) ---"

# The infinite loop starts here
while true; do
    echo "" # Added a blank line so it looks clean when it loops
    echo "What is your favorite Linux Distribution?"
    echo "1 - Ubuntu"
    echo "2 - Arch"
    echo "3 - Fedora"
    echo "4 - Something else"
    echo "q - Quit Menu"

    read -p "Enter your choice: " distro

    case $distro in
        1)
            echo "Ubuntu is great for beginners and stability! 🏢" ;;
        2)
            echo "Arch is for the bold! 'I use Arch btw.' 🚀" ;;
        3)
            echo "Fedora is leading the way with new tech! 🎩" ;;
        4)
            echo "There are so many great ones out there! 🐧" ;;
        [qQ])
            echo "Exiting the menu..."
            break ;; # This is the magic command that kills the 'while' loop
        *)
            echo "Invalid selection. Please enter 1-4, or 'q' to quit." ;;
    esac
done

echo "---------------------------------------------------"

echo "--- 2. Pattern Matching (Strings) ---"
read -p "Do you want to continue? (yes/no): " answer

# Case allows you to catch multiple variations using the '|' (OR) symbol
case $answer in
    [yY] | [yY][eE][sS])
        echo "Moving forward! 🏃‍♂️"
        ;;
    [nN] | [nN][oO])
        echo "Stopping execution. 🛑"
        exit 0
        ;;
    *)
        echo "I'll take that as a 'No'..."
        ;;
esac

echo "---------------------------------------------------"
echo "Case statement exercise complete!"
