#!/bin/sh

# Constants

#file name + desired location
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
    case ${answer:0:1} in
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
echo "  -a | !NOT IMPLEMENTED! Includes alternate method in fix"
echo "Devices covered:"
echo "  This fix currently only supports the Saitek/Cyborg R.A.T.3 mouse"
echo "  In future this fix could cover the Mad Catz successor line"
echo "Permissions:"
echo "  This script must be run in root i.e. 'sudo sh install.sh'"
echo ""



exit
}

start()
{
echo "
"
echo "Cyborg R.A.T. 3 Fix for X11 Systems"
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
case ${answer:0:1} in
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
while getopts 'h' flag; do 
    case $flag in
        h) help_script
    esac
done


# request sudo privileges
if sudo -nv 2>/dev/null && sudo -v ; then
    start
else
    echo ""
    echo "This fix requires root privileges"
    # asks to rerun script as sudo
    sudo echo ""
    start
    echo ""
fi
