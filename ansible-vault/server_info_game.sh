#!/bin/bash

# Function to display server information
display_server_info() {
    echo "=== Server Information ==="
    echo "Hostname: $(hostname)"
    echo "Operating System: $(uname -o)"
    echo "Kernel Version: $(uname -r)"
    echo "Architecture: $(uname -m)"
    echo "Uptime: $(uptime -p)"
    echo "Total Memory: $(free -h | grep Mem | awk '{print $2}')"
    echo "Available Memory: $(free -h | grep Mem | awk '{print $7}')"
    echo "Disk Usage: $(df -h / | grep / | awk '{print $5}')"
    echo "IP Address: $(hostname -I | awk '{print $1}')"
    echo "==========================="
}

# Function for the guessing game
guessing_game() {
    echo "$welcome_message"  # Use the welcome message from secrets.yml
    echo "I have selected a number between 1 and 10."
    secret_number=$((RANDOM % 10 + 1))
    attempts=0
    max_attempts=3

    while [ $attempts -lt $max_attempts ]; do
        read -p "Enter your guess (1-10): " guess
        attempts=$((attempts + 1))

        if [[ $guess -eq $secret_number ]]; then
            echo "Congratulations! You guessed the number in $attempts attempts."
            return
        elif [[ $guess -lt $secret_number ]]; then
            echo "Too low! Try again."
        else
            echo "Too high! Try again."
        fi
    done

    echo "Sorry! The correct number was $secret_number. Better luck next time!"
}

# Load variables from secrets.yml without yq
if [ -f secrets.yml ]; then
    welcome_message=$(grep 'welcome_message:' secrets.yml | awk -F ': ' '{print $2}')
    api_key=$(grep 'api_key:' secrets.yml | awk -F ': ' '{print $2}')
else
    echo "secrets.yml file not found."
    exit 1
fi

# Main script execution
display_server_info
guessing_game
