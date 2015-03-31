#!/bin/zsh

CWD=$(pwd)


# Install the fonts...
ln -s "$CWD/fonts/.fonts" "$HOME/.fonts"

if [[ -n `which fc-cache` ]]; then
  fc-cache -f "$HOME/.fonts"
fi

exit 0

# Add all the dotfiles as symlinks...
# Add i3
ln -s "$CWD/i3/.i3" "$HOME/.i3"

# Add xterm conf
ln -s "$CWD/X/.Xresources" "$HOME/.Xresources"

# Add vim
ln -s "$CWD/vim/.vim" "$HOME/.vim"
ln -s "$CWD/vim/.vimrc" "$HOME/.vimrc"

# Add tmux
ln -s "$CWD/tmux/.tmux.conf" "$HOME/.tmux.conf"
