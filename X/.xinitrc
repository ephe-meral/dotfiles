# Merge the existing X settings with our additional ones (for xterm & urxvt)
# we should check if this is really needed (depending on the used term)
xrdb -merge ~/.Xresources &

# Checks the standard dirs to be present, fills ENV vars
xdg-user-dirs-update &

# Start the plumber for program interconnectivity
plan9 plumber -p ~/.plumbing &

# Start the editor service (TODO: currently disabled)
#NVIM_LISTEN_ADDRESS=127.0.0.1:6666 nvim --headless &

# Some eyecandy (wallpaper, colors, window transitions & transparency...)
feh --bg-fill ~/.wallpaper.jpg &
redshift -l 55.7:12.6 &
compton -CGb &

# Finally start the window manager tool
exec i3
