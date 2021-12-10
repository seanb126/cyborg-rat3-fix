#!/bin/sh

# Constants

#file name + desired location
FILENAME="/etc/X11/xorg.conf.d/910-rat-xx.conf"

# fix text
FIX='# RAT3 mouse
Section "InputClass"
 Identifier "Mouse Remap"
 MatchProduct "Saitek Cyborg R.A.T.3 Mouse"
 MatchDevicePath "/dev/input/event*"
 Option "ButtonMapping" "1 2 3 4 5 0 0 8 9 0 0 0 13 14"
EndSection'

# this is more for appearances
progress_bar()
{
echo -ne '#########                                            (20%)\r'
sleep 0.2
echo -ne '####################                                 (40%)\r'
sleep 0.2
echo -ne '#################################                    (66%)\r'
sleep 0.2
echo -ne '########################################             (82%)\r'
sleep 0.2
echo -ne '##################################################   (100%)\r'
echo -ne '\n'
}

install_fix()
{

echo "creating file..."
touch $FILENAME || error_msg
progress_bar
echo ""

# appends fix text to file
echo "Writing fix to file..."
echo "$FIX" > $FILENAME || error_msg
progress_bar
echo ""
echo "Install Complete"
echo ""
echo "For effects to take place you must restart Xorg/X11 or restart your system"
echo ""
exit
}

reinstall_fix()
{
# removes file
echo ""
echo "Removing previous install..." 
rm -rf $FILENAME || error_msg
progress_bar

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
    continue
else
    echo "This script requires sudo/root privileges"
    # asks to rerun script as sudo
    sudo sh install.sh || error_msg
    exit # closes current script
fi

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




