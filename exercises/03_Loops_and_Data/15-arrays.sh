#!/bin/bash

# -------------------------------------------------------------------------
# Script Name: 15-arrays-sh
# Description: Demonstrating Indexed and Associative arrays in Bash.
# -------------------------------------------------------------------------

# --- 1. INDEXED ARRAYS (Simple Lists) ---
# Declaring an array of my favorite Linux distributions
distros=("Ubuntu" "Fedora" "Debian" "Arch" "Mint")

echo "--- Indexed Array Demo ---"

# Accessing a specific element (Index starts at 0)
echo "The first distro in the list is: ${distros[0]}"
echo "The third distro in the list is: ${distros[2]}"

# Adding an element to the array
distros+=("Pop!_OS")

# Printing the total number of elements in the array
echo "Total distros in the list: ${#distros[@]}"

# Printing ALL elements in the array
echo "All distros: ${distros[@]}"

echo ""

# --- 2. ASSOCIATIVE ARRAYS (Key-Value Pairs) ---
# Note: Requires Bash 4.0+. We must explicitly declare it using -A.
declare -A server_ips

server_ips=( ["web-server"]="192.168.1.10" ["db-server"]="192.168.1.20" ["mail-server"]="192.168.1.30" )

echo "--- Associative Array Demo ---"

# Accessing a value using its key
echo "The IP address for the database is: ${server_ips[db-server]}"

# Adding a new key-value pair
server_ips["backup-server"]="192.168.1.40"

echo "Total servers monitored: ${#server_ips[@]}"

echo ""

# --- 3. LOOPING THROUGH ARRAYS ---
echo "--- Looping Demo ---"
echo "Iterating through the Distros list:"

for distro in "${distros[@]}"; do
    echo " - Testing distro: $distro"
done

echo ""
echo "Iterating through Server Keys and Values:"
for server in "${!server_ips[@]}"; do
    echo " - Server: $server | IP: ${server_ips[$server]}"
done

echo "--------------------------"
