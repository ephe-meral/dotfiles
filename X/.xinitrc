# Merge the existing X settings with our additional ones (for xterm & urxvt)
# we should check if this is really needed (depending on the used term)
xrdb -merge $HOME/.Xresources &

# Checks the standard dirs to be present, fills ENV vars
xdg-user-dirs-update &

# Start the plumber for program interconnectivity
plan9 plumber -p $HOME/.plumbing &

# Start the editor service (TODO: currently disabled)
#NVIM_LISTEN_ADDRESS=127.0.0.1:6666 nvim --headless &

# Some eyecandy (wallpaper, colors, window transitions & transparency...)
feh --bg-fill $HOME/.wallpaper.jpg &
redshift -l 55.7:12.6 &
compton -CGb &

# Start the bitlbee local server (IM->IRC aggregator)
bitlbee -F -i 127.0.0.1 -p 33337 -c $HOME/.bitlbee -d $HOME/.config/bitlbee &

# Finally start the window manager tool
exec i3
