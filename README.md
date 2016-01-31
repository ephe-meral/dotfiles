# dotfiles

Personal configuration files. Relies on the standard german keyboard layout.

- OS: FreeBSD 10.x
- Terminal: terminology
- Windowmanager: i3
- Editor: VIM / Spacemacs
- Additionally:
  - arandr
  - compton
  - dmenu
  - feh
  - imagemagick
  - htop (with linux compat)
  - pass
  - scrot
  - tmux

## Install

#### zsh

Make sure to install this before linking the .zshrc file, then remove the one created
by the script and link to the one from the repo.

```shell
$ chsh -s /usr/local/bin/zsh
$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

#### dotfiles/folders

Simply link from your home to the stuff in the folders:

```shell
$ ln -s [full path to dotfile/folder in repo] [full path to dotfile/folder in home]
```

These are the current files & folders that need linking:

```
.
├── X
│   ├── .Xresources
│   └── .xinitrc
├── fonts
│   └── .fonts/
├── i3
│   └── .i3
├── spacemacs
│   └── .spacemacs
├── tmux
│   └── .tmux.conf
├── vim
│   ├── .vim/
│   └── .vimrc
└── zsh
    └── .zshrc
```

#### fonts

```shell
$ fc-cache -f ~/.fonts
```

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
