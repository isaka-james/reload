#!/bin/bash

# Texts colors
blue_bold_text="\e[1;34m"
magenta_bold_text="\e[1;35m"
green_bold_text="\e[1;32m"
cyan_bold_text="\e[1;36m"
red_text="\e[1;31m"

# Background colors
cyan_bg="\e[46m"
magenta_bg="\e[45m"

# reseting colors
reset_color="\e[0m"


# Function to display each line of ASCII art
display_ascii_art() {
    echo "           ,___________________________________________/7_ "
    echo -e "           |-_______------. \`\\         $tool"
    echo -e "       _,/ | _______)     |___\\_________________________|"
    echo "  .__/\`((  | _______      | (/))_______________=."
    echo "     \`~) \\ | _______)     |   /----------------_/"
    echo "       \`__y|______________|  /"
    echo "       / ________ __________/"
    echo "      / /#####\\(  \\  /     ))"
    echo "     / /#######|\\  \\(     //"
    echo "    / /########|.\______ad/\`"
    echo "   / /###(\\)###||\`------\`"
    echo "  / /##########||"
    echo -e " / /###$magenta_bold_text$tool_version$reset_color##||"
    echo "( (############||"
    echo " \\ \\####(\\)####))"
    echo "  \\ \\#########//"
    echo "   \\ \\#######//"
    echo "    \`---|_|--\`"
    echo "       ((_))"
    echo "        \`-'"
}
