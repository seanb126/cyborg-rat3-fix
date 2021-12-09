#!/bin/sh

echo "Cyborg R.A.T 3 Fix"
echo "Created by seanb126"

# checks if file exists
#if [ -e /etc/X11/xorg.conf.d/50-vmmouse.conf ]

FILENAME="test.txt"
FIX="line"

if [ -e test.txt ]
then
    echo "file exists"
    if [ ! -z $(grep "$FIX" "$FILENAME") ] ; then
        echo "line found"
    else
        "line not found"
        echo "$FIX" > $FILENAME
        cat $FILENAME
    fi
else
    echo "nope"
fi