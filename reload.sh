#!/bin/bash

# import the global variables like tool,version,author
source "$(dirname "$0")/global.sh"

# import the ascii variables & functions 
. "$(dirname "$0")/arts/ascii.sh"

# setting up the reload
. "$(dirname "$0")/settings/setup.sh"

# include the command folder
. "$(dirname "$0")/settings/temp.sh"



# Displaying the startingups animations
display_ascii_art
echo -e "${blue_bold_text}${cyan_bg}${green_bold_text}$tool${reset_color}${magenta_bg}started..${reset_color}\n"

echo "$tool_dir"

# Flag to check if the script should continue -> carry status of the tool
running=true



# The functions & Logic for termination logic
. "$(dirname "$0")/logic/sig.sh"



# The MAIN
source "$(dirname "$0")/logic/main.sh"

