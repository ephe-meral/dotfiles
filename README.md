# dotfiles

Personal configuration files. Relies on the standard german keyboard layout.

- OS: PC-BSD 10.x
- Terminal: xterm
- Windowmanager: i3
- Editor: VIM
- Additionally:
  - tmux
  - lxappearance
  - lxrandr

## install

#### zsh

```shell
$ chsh -s /bin/zsh
$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

Set theme in .zshrc to "nanotech"

#### transparency

```shell
Xcompmgr
$ echo "xcompmgr -c &" >> ~./xprofile

transset
$ echo "[ -n "$XTERM_VERSION" ] && transset -a >/dev/null" >> ~./.zshrc
```

#### xterm config 

(executed in i3 startup, X didnt recognize the file...)

```shell
$ xrdb -merge ~/.Xresources
```
