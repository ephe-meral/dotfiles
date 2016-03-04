# dotfiles

Personal configuration files.
Relies on the standard german keyboard layout.

- OS: FreeBSD 10.x
- Terminal: rxvt-unicode
- Windowmanager: i3
- Editor: NeoVIM / VIM / Spacemacs
- Additionally: (essential tools)
  - arandr
  - compton
  - dmenu
  - feh
  - git
  - imagemagick
  - htop (with linux compat)
  - password-store
  - plan9port
  - redshift
  - scrot
  - tmux
  - urxvt-perls
  - xclip

## Install

The following snippets are provided for convenience and to be able to selectively install stuff. Put them in a shell script in case you need to run things automagically.

#### zsh

Make sure to install this before linking the .zshrc file, then remove the one created
by the script and link to the one from the repo.

```
$ chsh -s /usr/local/bin/zsh
$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

#### home folders

```
$ mkdir -p ~/.bin ~/documents ~/downloads/transfer ~/media/usb ~/music ~/pictures ~/projects ~/work
```

#### this repo

```
$ cd ~/projects && git clone git@github.com:ephe-meral/dotfiles.git
```

#### dotfiles/folders

Symlink the repo stuff to your home:

```
$ ln -s $HOME/projects/dotfiles/[folder or file in repo] $HOME/[folder or file in home]
```

These are the current files & folders that need linking:

```
$ tree -aL 2
.
├── X
│   ├── .Xresources
│   └── .xinitrc
├── fonts (special, see below)
│   ├── .fonts/
│   └── local.conf
├── i3
│   └── .i3/
├── nvim (special, see below)
│   └── nvim/
├── scripts (special, see below)
│   ├── mount-usb
│   ├── plan9
│   ├── umount-usb
│   └── update-ports.sh
├── spacemacs
│   └── .spacemacs
├── tmux
│   └── .tmux.conf
└── zsh
    └── .zshrc
```

#### fonts

```
$ fc-cache -f ~/.fonts
$ sudo cp fonts/local.conf /usr/local/etc/fonts/
```

#### term

http://st.suckless.org

````
$ cd $HOME/projects && fetch http://dl.suckless.org/st/st-0.6.tar.gz && tar -xf st-0.6.tar.gz && mv st-0.6 st
$ set "st-0.6-argbbg.diff" && fetch http://st.suckless.org/patches/$1 && git apply $1
$ set "st-0.6-clipboard.diff" && fetch http://st.suckless.org/patches/$1 && git apply $1
$ set "st-0.6-hidecursor.diff" && fetch http://st.suckless.org/patches/$1 && git apply $1
$ ln -s $HOME/projects/dotfiles/compiled/st/config.h $HOME/projects/st/config.h
$ make
$ ln -s $HOME/projects/st/st $HOME/.bin/st
````

#### neovim

```
$ ln -s $HOME/projects/dotfiles/nvim/nvim $HOME/.config/nvim
```

Or, for older neovim versions

```
$ ln -s $HOME/projects/dotfiles/nvim/nvim $HOME/.nvim
$ ln -s $HOME/projects/dotfiles/nvim/nvim/init.vim $HOME/.nvimrc
```

Then, in neovim, install the plugins:

```
:PlugInstall
```

#### scripts

Symlink whatever you need to $HOME/.bin/[script name] instead of the standard approach

#### weechat

Add buffers.pl

```
/script install buffers.pl
/set weechat.bar.buffers.size 15
```

Enable mouse:

```
/set weechat.look.mouse on
/mouse enable
```
