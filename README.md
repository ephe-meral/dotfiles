# dotfiles

Personal configuration files.
Relies on the standard german keyboard layout.

- OS: Voidlinux (alternatively: FreeBSD 11.x)
- Terminal: [suckless' simple term](http://st.suckless.org) ($TERM set as xterm-color)
- Windowmanager: i3
- Editor: NeoVIM
- Additionally: (essential tools)
  - arandr
  - bitlbee & bitlbee-facebook
  - compton
  - dmenu
  - feh
  - git
  - gnupg
  - i3status
  - imagemagick
  - htop (with linux compat)
  - password-store (or 'pass')
  - redshift
  - scrot
  - slim
  - weechat
  - xclip
  - xdg-user-dir
  - xpdf / mupdf
- More stuff: (based on need)
  - [tectonic](https://tectonic-typesetting.github.io/en-US/)
  - [entr](http://entrproject.org/)

## Install

The following snippets are provided for convenience and to be able to selectively install stuff. Put them in a shell script in case you need to run things automagically.

#### zsh

Make sure to install this before linking the .zshrc file, then remove the one created
by the script and link everything from `.zprezto/runcoms`

```
$ chsh -s /usr/local/bin/zsh
$ git clone --recursive git@github.com:ephe-meral/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ cd ~/.zprezto && git remote add upstream https://github.com/sorin-ionescu/prezto.git && cd -
```

To update Prezto, run:

```
$ cd ~/.zprezto
$ git fetch upstream master && git rebase upstream/master
$ git submodule update --init --recursive
$ git push
```

#### this repo

```
$ mkdir ~/projects
$ cd ~/projects && git clone git@github.com:ephe-meral/dotfiles.git
```

#### home folders

Note that these contain lower-cased names. To correctly set these, we run `xdg-user-dirs-update` during startup. (See `X/.xinit.rc`)

```
$ mkdir -p ~/.bin ~/.config ~/documents ~/downloads/transfer ~/media/usb ~/music ~/pictures ~/work
$ ln -s $HOME/projects/dotfiles/X/user-dirs.dirs $HOME/.config/
$ ln -s $HOME/projects/dotfiles/X/user-dirs.locale $HOME/.config/
```

#### i3

No special handling. Link the folder as instructed below.


#### dotfiles/folders

Symlink the repo stuff to your home:

```
$ ln -s $HOME/projects/dotfiles/[folder or file in repo] $HOME/[folder or file in home]
```

These are the current files & folders that need linking: (For special instructions see in-line comment or below)

```
$ tree -aL 2
.
├── X (-> ~/)
│   ├── .Xresources
│   ├── .xinitrc
│   ├── user-dirs.dirs
│   └── user-dirs.locale
├── compiled (-> see below)
│   └── st/
├── fonts (-> see below)
│   ├── .fonts/
│   └── local.conf
├── i3 (-> ~/)
│   └── .i3/
├── nvim (-> ~/.config, see below)
│   └── nvim/
├── plan9 (-> ~/ if needed)
│   └── .plumbing
├── scripts (-> ~/.bin if needed)
│   ├── build_tex
│   ├── mount-usb
│   ├── plan9
│   ├── umount-usb
│   └── update-ports.sh
├── spacemacs (-> ~/)
│   └── .spacemacs
└── tmux (-> ~/)
    └── .tmux.conf
```

#### fonts

Install this before the terminal etc.

```
$ fc-cache -f ~/.fonts
$ sudo cp fonts/local.conf /usr/local/etc/fonts/
```

#### compiled (st)

http://st.suckless.org

````
$ git clone git://git.suckless.org/st
$ git checkout 041912a791e8c2f4d5d2415b16210d29d7e701c5 # Approx. 0.8.1 + 3 commits, 29.03.18
$ git apply st-alpha-0.8.1.diff
$ git apply st-clipboard-20180309-c5ba9c0.diff
$ git apply -3 st-hidecursor-0.8.diff # Use -3 here because diff is not up-to-date with repo
$ git apply st-scrollback-0.8.diff
$ vi st-scrollback-mouse-0.8.diff # Find the st.h 129 diff, make sure the 'alpha' var from st-alpha diff is in there
$ git apply --recount st-scrollback-mouse-0.8.diff
$ sudo make clean install
````

#### neovim

Link `nvim`. Then, in neovim, install the plugins:

```
:PlugInstall
```

#### scripts

Symlink whatever you need to $HOME/.bin/[script name] instead of the standard approach

#### bitlbee

Be sure to initialize the user-data dir, and copy any settings from offline storage.

```
$ mkdir -p ~/.config/bitlbee
```

#### weechat

Copy any settings (the `~/.weechat` folder) from offline storage.

Note: After weechat vers. 1.8 the buflist plugin for a sidepanel with buffers will be installed by default.

Enable mouse:

```
/set weechat.look.mouse on
/mouse enable
```

#### tex building

Install tectonic, entr and mupdf and then use the following command to continuously build and update the PDF file when the source texfile changes:

```
$ build_tex yourtexfile.tex
```
