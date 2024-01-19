#!/bin/bash

while $running; do
    # Get the current directory
    directory_path=$(pwd)

    # Calculate the time 1 second ago in seconds since the epoch
    time_threshold=$(date -d 'now - 1 seconds' +%s)

    # Use find to locate files modified in the last 1 second
    find "$directory_path" -type f -newermt "@$time_threshold" -exec bash -c '
        for file_path do
            # Get the modification time in seconds since the epoch
            modification_time=$(stat -c %Y "$file_path")

            # Convert the modification time to a human-readable format
            modification_date=$(date -d @"$modification_time")

            # Print the file name and modification date
            echo -e "\e[0m\e[1;35mChange Detected\e[0m :\e[1;36m$file_path"

        done
    ' bash {} +

    # Check for user input to terminate the script
    read -t 1 -n 1 key
    if [[ $key == 'q' ]]; then
        terminate_script
    fi
done

