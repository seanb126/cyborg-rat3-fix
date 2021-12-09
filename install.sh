#!/bin/sh

echo "Cyborg R.A.T 3 Fix"
echo "Created by seanb126"

echo "Fix based off "

#FILENAME="/etc/X11/xorg.conf.d/50-vmmouse.conf" method 1
FILENAME="/etc/X11/xorg.conf.d/910-rat-xx.conf"

# current fix deletes functionality
# FIX='Section "InputDevice"
#     Identifier     "Mouse0"
#     Driver         "evdev"
#     Option         "Name" "Saitek Cyborg R.A.T.3 Mouse"
#     Option         "Vendor" "06a3"
#     Option         "Product" "0ccc"
#     Option         "Protocol" "auto"
#     Option         "Device" "/dev/input/event4"
#     Option         "Emulate3Buttons" "no"
#     Option         "Buttons" "7"
#     Option         "ZAxisMapping" "4 5"
#     Option         "ButtonMapping" "1 2 3 4 5 6 7 0 0 0 0 0 0 0"
#     Option         "Resolution" "3200"
# EndSection'

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