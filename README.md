# Dotfiles

Personal configuration files mirrored under `home/` and linked into the home
directory by `install.sh`. The paths to install are listed in `links.txt`.

## Install

Run this from the repository root:

```sh
./install.sh
```

Existing files are never overwritten. If a target path already exists, it is
moved to `~/.dotfiles-backup/` before the repository link is created.

For a new machine, run:

```sh
./bootstrap.sh
```

The bootstrap script checks the basic prerequisites and then runs the installer.

## Layout

The `home/` directory mirrors `$HOME`:

```text
home/
├── .zshrc
├── .bashrc
├── .gitconfig
├── .vimrc
└── .config/
    ├── nvim/
    ├── starship.toml
    └── tmux/
```

Only paths listed in `links.txt` are linked. Each entry is relative to `home/`
and may refer to either a file or a directory. Blank lines and lines beginning
with `#` are ignored. Future applications can be added by placing their files
under `home/` and adding the relative path to `links.txt`.
