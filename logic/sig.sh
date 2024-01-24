#!/bin/bash

# Function to handle script termination
function terminate_script() {
    echo -e "\n\t$red_text$tool terminated!$reset_color\n"
    rm -rf "$(dirname "$0")/settings/temp.sh"
    exit 0
}

reload_server() {
    local reload_command="$reload"
    eval "$reload_command"
    echo -e "\n"
}

check_and_terminate_existing_php() {
    local existing_pid=$(lsof -i :$port_number | awk 'NR==2{print $2}')
    if [ -n "$existing_pid" ]; then
        echo "Terminating existing process (PID: $existing_pid)..."
        kill $existing_pid
        sleep 2  # Allow time for the process to terminate gracefully
    fi
}
# Trap signals for cancellation #and suspension
trap "echo -e 'Program canceled: '; terminate_script" SIGINT


