#!/bin/bash

# Simple Interest Calculator

echo "=== Simple Interest Calculator ==="

# Function to validate if input is a valid number (integer or float)
validate_number() {
    if [[ ! "$1" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: '$1' is not a valid number."
        exit 1
    fi
}

# Prompt user for inputs
read -p "Enter the principal amount ($): " principal
validate_number "$principal"

read -p "Enter the annual interest rate (%): " rate
validate_number "$rate"

read -p "Enter the time period (in years): " time
validate_number "$time"

# Perform floating-point math using 'bc' (Basic Calculator)
# SI = (P * R * T) / 100
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Total Balance = Principal + Interest
total=$(echo "scale=2; $principal + $interest" | bc)

# Print the results
echo -e "\n--- Results ---"
printf "Principal Amount: $%.2f\n" "$principal"
printf "Interest Earned:  $%.2f\n" "$interest"
printf "Total Balance:    $%.2f\n" "$total"
