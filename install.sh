#!/bin/bash


if [ "$(id -u)" -ne 0 ]; then
    echo -e "You should run as \e[0;101m\e[1;97mroot\e[0m\e[0m!"
    echo -e "Don't worry, we won't install 'reload' in root.."
    exit 1
fi





tool="reload"
opt="/opt/reload"
sbin="/sbin/reload"

echo -e "\n\tStarting[$tool]..\n"


# Check if the tool was installed before and delete the previous version
if [ -d "$opt" ]; then
    echo -e "\t\t$tool: \"${opt}\" directory was found .."
    rm -rf "${opt}"
    echo -e "\t\t$tool: \"${opt}\" was removed .."
fi 

if [ -e "$sbin" ]; then
    echo -e "\t\t$tool: \"${sbin}\" file was found .."
    rm -rf "${sbin}"
    echo -e "\t\t$tool: \"${sbin} was removed .."
fi 

chmod +x reload
echo -e "\t\t$tool: 'reload' file was executed .."

mkdir /opt/reload
echo -e "\t\t$tool: '/opt/reload' folder was made .."

echo -e "\t\t$tool: copying files to /opt/reload .."
cp -r arts logic settings global.sh install.sh README.MD reload.sh  /opt/reload
echo -e "\t\t$tool: files and folders were moved to /opt/reload .."

cp -r reload /sbin
echo -e "\t\t$tool: 'reload' was moved to /sbin .."

chmod 777 "${opt}/settings" "$opt" "${opt}/*"

echo -e "\t\t$tool: Hoooorey, Installation complete!! .."

echo -e "\n\t\tNow you can type 'reload' to command line to open the tool!"

