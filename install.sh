#!/bin/bash

# Constants

#file name + desired location
DIR = /etc/X11/xorg.conf.d/
FILENAME="/etc/X11/xorg.conf.d/cyborg-rat3-fix.conf"

# fix
FIX='Section "InputClass"
 Identifier "Saitek Cyborg R.A.T.3 Mouse Remap"
 MatchProduct "Saitek Cyborg R.A.T.3 Mouse"
 MatchDevicePath "/dev/input/event*"
 MatchIsPointer "True"
 Option "ButtonMapping" "1 2 3 4 5 0 0 8 9 0 0 0 13 14"
EndSection'


install_fix()
{
# checks if directory exists
echo -ne "Checking directory...\r"
if [ -e $DIR ]
then
    echo -ne "Checking directory...Done\r"
    echo -ne "\n"
    :
else
    echo -ne "Directory not found creating new path..."
    mkdir /etc/X11/xorg.conf.d/ || error_msg
    echo -ne "Directory created"
    echo -ne "\n"
fi

echo -ne "Creating file...\r"
touch $FILENAME || error_msg
sleep 1
echo -ne "Creating file...Done\r"
echo -ne "\n"

# appends fix text to file
echo -ne "Writing fix to file...\r"
echo "$FIX" > $FILENAME || error_msg
sleep 1
echo -ne "Writing fix to file...Done\r"
echo -ne "\n"
echo "Install Complete"
echo ""
echo "Restart X Server/X11 or your system to apply fix"
echo ""
exit
}

reinstall_fix()
{
# removes file
echo ""
echo -ne "Removing previous install...\r" 
rm -rf $FILENAME || error_msg
sleep 1
echo -ne "Removing previous install...Done\r" 
echo -ne '\n'

# installs fix
install_fix
}

execute_install()
{

# if file exists
if [ -e $FILENAME ]
then
    echo "
    "
    echo "The fix appears to already be installed."
    echo ""
    read -p "Do you wish to reinstall ? (y/N)" answer
    case ${answer} in
        y|Y|yes|Yes|YES )
            reinstall_fix || error_msg
        ;;
        * )
            exit
        ;;
    esac
else
    install_fix
fi
}

error_msg()
{
echo ""
echo "ERROR! Install failed."
echo ""
echo "If a permission error was thrown, try running the script in root with: 'sudo install.sh'"
echo ""
echo "Please report any issues to 'github.com/seanb126/cyborg-rat3-fix/issues'"
echo ""
exit
}

help_script()
{
echo "
"
echo "Cyborg R.A.T. 3 Fix for X11 Systems"
echo "Created by seanb126"
echo ""
echo "This software is licensed under the MIT License."
echo "
HELP MENU"
echo "Commands:"
echo "  -h | Invokes the installers help menu"
echo "  -r | Brings you to uninstall menu"


exit
}

remove_fix()
{
echo ""
echo "Removing fix for Cyborg R.A.T.3 for Linux with X Server"
echo -ne "Checking if previous install exists...\r"

sleep 1
if [ -e $FILENAME ]
then
    # remove menu
    echo -ne "Checking if previous install exists...Done\r"
    echo -ne "\n"
    echo ""
    read -p "Do you wish to uninstall fix ? (y/N)" answer
    case ${answer} in
        y|Y|yes|Yes|YES )
            echo -ne "Uninstalling fix...\r"
            rm -rf $FILENAME || error_msg
            echo -ne "Uninstalling fix...Done\r"
            echo -ne "\n"
            echo "Fix uninstalled"
            exit
        ;;
        * )
            echo -ne "\n"
            exit
        ;;
    esac
else
    echo ""
    echo "Cannot find previous installation"
    echo ""
    echo "If this is an issue please report to: github.com/seanb126/cyborg-rat3-fix/issues"
    echo ""
    echo "Check if this file and location exists: /etc/X11/xorg.conf.d/"
    echo "Then delete this file to manually uninistall: cyborg-rat3-fix.conf "
    exit
fi
}

start()
{
echo "
"
echo "Cyborg R.A.T. 3 Fix for Linux with X Server"
echo "Created by seanb126"
echo "
"
echo "This software is licensed under the MIT License."
echo "
    "
echo "WARNING: It is advised that you backup your system before installing!"
echo ""
# asks user if they wish to proceed
read -p "Are you sure you wish to proceed? (y/N)" answer
case ${answer} in
    y|Y|yes|Yes|YES )
        execute_install || error_msg
    ;;
    * )
        exit
    ;;
esac
}


###
# Script starts here
###    

# checks for run flags
while getopts "h:r" flag; do 
    case $flag in
        h) help_script
            ;;
        r) remove_fix
            ;;
    esac
done


# request sudo privileges
if sudo -nv 2>/dev/null && sudo -v ; then
    start
else
    echo ""
    echo "This fix requires root privileges"
    # asks to rerun script as sudo
    sudo echo "" || error_msg
    start
    echo ""
fi
