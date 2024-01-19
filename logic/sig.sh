#!/bin/bash

# Function to handle script termination
function terminate_script() {
    echo -e "\n\t$red_text$tool terminated!$reset_color\n"
    exit 0
}


# Trap signals for cancellation #and suspension
trap "echo -e 'Program canceled: '; terminate_script" SIGINT
