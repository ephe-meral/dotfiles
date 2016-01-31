#!/bin/sh

# This will decrease the screen brightness value
# that is stored in /tmp/brightlvl.
# valid range is 0-16

if [ ! -f /tmp/brightlvl ]; then
        echo 99 > /tmp/brightlvl
fi
lvl=`cat /tmp/brightlvl`
if [ $lvl -lt 1 ]; then
        echo 1
        exit 0
fi
lvl=`expr $lvl - 10`
echo $lvl > /tmp/brightlvl
echo $lvl
exit 0
