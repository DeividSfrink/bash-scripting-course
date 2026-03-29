#!/bin/bash

# ------------------------------------------------------------------
# Script Name: 03-math-functions.sh
# Description: Demonstrates basic arithmetic operations, 
#              Arithmetic Expansion $(( )), and the * wildcard.
# ------------------------------------------------------------------

# 1. Variable Assignment (Numbers)
num1=10
num2=5

# 2. Basic Arithmetic
# We use $(( expression )) to tell Bash to calculate the math.
sum=$((num1 + num2))
subtraction=$((num1 - num2))
multiplication=$((num1 * num2))
division=$((num1 / num2))

# 3. Displaying Results
echo "The sum of $num1 and $num2 is: $sum"
echo "The difference is: $subtraction"
echo "The product is: $multiplication"
echo "The quotient is: $division"

# 4. Note on Division
# IMPORTANT: Bash only handles "Integer Math" (whole numbers).
# It does NOT do decimals (floating point) by default.
echo "Note: 10 divided by 3 in Bash is $((10 / 3)), not 3.33!"

# 5. The Asterisk (*) Danger
# In Linux, * is a 'Wildcard' that usually means 'everything in this folder.'
# Inside $(( )), it is SAFE to use for multiplication.
# Outside of $(( )), you must 'escape' it with a backslash (\*) if using 
# older tools like 'expr', otherwise Bash will try to list your files!
echo "Using expr with an escaped asterisk: $(expr 10 \* 5)"
