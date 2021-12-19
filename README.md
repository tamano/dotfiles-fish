# dotfiles-fish
dotfiles for fish env

## how to install

### requirement
- install [homebrew](https://brew.sh/index).

### dotfiles
```sh
cd ~
git clone git@github.com:tamano/dotfiles-fish.git
sh dotfiles-fish/etc/install.sh
```

### dein.vim

```sh
cd /tmp/
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```

start `nvim` and put command below

```vim
:call dein#install()
```

