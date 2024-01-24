#!/bin/bash


while true; do
    # Get the current directory
    directory_path=$(pwd)

    # Calculate the time 2 seconds ago in seconds since the epoch
    time_threshold=$(date -d 'now - 2 seconds' +%s)

    # Use find to locate files modified in the last 2 seconds
    changed_files=$(find "$directory_path" -type f -newermt "@$time_threshold")

    if [ -n "$changed_files" ]; then
        for file_path in $changed_files; do
            # Get the modification time in seconds since the epoch
            modification_time=$(stat -c %Y "$file_path")

            # Convert the modification time to a human-readable format
            modification_date=$(date -d @"$modification_time")

            echo -e "\n\n\e[0m\e[1;35mChange Detected\e[0m :\e[1;36m$file_path"
            echo -e "\e[0m\e[1;32mRunning: \e[1;33mphp -S localhost:8080 &\e[0m"

            check_and_terminate_existing_php
            reload_server
        done
    fi

    # Check for user input to terminate the script
    read -t 1 -n 1 key
    if [[ $key == 'q' ]]; then
        terminate_script
    fi

    # Sleep for 2 seconds before the next iteration
    sleep 2
done




