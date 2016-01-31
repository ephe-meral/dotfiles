#!/bin/sh

# This will increase the screen brightness value
# that is stored in /tmp/brightlvl.
# valid range is 0-16

if [ ! -f /tmp/brightlvl ]; then
        echo 0 > /tmp/brightlvl
fi
lvl=`cat /tmp/brightlvl`
if [ $lvl -gt 99 ]; then
				echo 99
        exit 0
fi
lvl=`expr $lvl + 10`
echo $lvl > /tmp/brightlvl
echo $lvl
exit 0
