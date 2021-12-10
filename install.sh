#!/bin/sudo sh

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
touch $FILENAME
echo "creating file..." ; progress_bar

echo ""

# appends fix text to file
echo "$FIX" > $FILENAME 
echo "Writing fix to file..."  ; progress_bar
echo ""
echo "Install Complete"
echo ""
echo "For effects to take place you must restart Xorg/X11 or restart your system"

}

reinstall_fix()
{
# removes file
rm -rf $FILENAME
echo ""
echo "Removing previous install..." ; progress_bar

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
}



###
# Script starts here
###    
echo "

"
echo "Cyborg R.A.T. 3 Fix for X11 systems"
echo "Created by seanb126"
echo "

"
echo "This software is licensed under the MIT License"
echo "See: 'github.com/seanb126/cyborg-rat3-fix/blob/main/LICENSE'" # insert license
echo "


    "
echo "WARNING: It is advised that you backup your system before installing!"
echo ""
read -p "Are you sure you wish to proceed? (y/N)" answer
case ${answer:0:1} in
    y|Y|yes|Yes|YES )
        execute_install || error_msg
    ;;
    * )
        exit
    ;;
esac




