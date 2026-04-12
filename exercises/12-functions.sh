#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 12-functions.sh
# Description: Demonstrates how to create reusable blocks of code 
#              (Functions) and the importance of variable scope.
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# FUNCTIONS GUIDE
# ------------------------------------------------------------------
# my_function() { ... }   | Define a function.
# local var_name          | Keeps a variable trapped inside the function.
# $1, $2, etc.            | Functions use their own positional parameters!
# return                  | Used to send an exit code back to the script.
# ------------------------------------------------------------------

# 1. A Basic Function 
# It doesn't run yet; it's just saved in memory for later.
print_header() {
    echo "------------------------------------------"
    echo "   SYSTEM HEALTH CHECK: $(date)"
    echo "------------------------------------------"
}

# 2. A Function with Arguments and 'local' variables
# Functions use their own positional parameters ($1, $2, etc.) and are "blind" to the outside script's arguments.
check_status() {
	# Using 'local' variables prevents global variable conflicts.
    # It takes the FIRST argument passed to the function call.
    local service_name=$1
    echo "Checking the status of: $service_name..."
    
    # We use a mock check here for the exercise
    if [ "$service_name" == "network" ]; then
        return 0 # Success
    else
        return 1 # Failure
    fi
}

# --- MAIN EXECUTION START ---

# Call the header function
print_header

# Ask the user for input and store it in a variable
read -p "Which service should we check? (e.g. network): " user_service
# Run the check_status function using the user's input as an argument.
if check_status "$user_service"; then
    echo "✅ Result: $user_service is running perfectly."
else
    echo "❌ Result: $user_service is NOT responding."
fi

echo "------------------------------------------"
echo "Exercise 12 complete!"
