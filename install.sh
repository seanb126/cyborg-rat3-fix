#!/bin/sh

execute_install()
{
FILENAME="/etc/X11/xorg.conf.d/910-rat-xx.conf"

FIX='# RAT3 mouse
Section "InputClass"
 Identifier "Mouse Remap"
 MatchProduct "Saitek Cyborg R.A.T.3 Mouse"
 MatchDevicePath "/dev/input/event*"
 Option "ButtonMapping" "1 2 3 4 5 0 0 8 9 0 0 0 13 14"
EndSection'

# if file exists
if [ -e $FILENAME ]
then
    # checks if fix already added
    if [ ! -z $(grep "$FIX" "$FILENAME") ] ; then
        echo "Fix already installed on this device"
    else
        # appends the fix to pre-existing file
        echo "$FIX" > $FILENAME
        #cat $FILENAME
    fi
else
    echo "file does not exist"
    echo "creating file..."
    touch $FILENAME
    echo "$FIX" > $FILENAME
fi
}

echo ""
echo "Cyborg R.A.T. 3 Fix for X11 systems"
echo "Created by seanb126"
echo ""
echo "This software is licensed under the MIT License"
echo "See: " # insert license
echo ""
#echo "Fix based off https://wiki.archlinux.org/title/Mad_Catz_Mouse"
echo ""

echo "WARNING: It is advised that you create a system backup before proceeding!"
echo ""
read -p "Are you sure you wish to proceed? (y/N)" answer
case ${answer:0:1} in
    y|Y|yes|Yes|YES )
        execute_install
    ;;
    * )
        exit
    ;;
esac


