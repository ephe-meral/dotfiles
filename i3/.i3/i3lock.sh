#!/bin/bash
scrot /tmp/screen_locked1.png
convert -resize 10% /tmp/screen_locked1.png /tmp/screen_locked2.png
convert -resize 1000% /tmp/screen_locked2.png /tmp/screen_locked3.png
#convert /tmp/screen_locked.png -blur 2x2 /tmp/screen_locked2.png
i3lock -i /tmp/screen_locked3.png
