# Dotfiles

Personal application configurations managed as GNU Stow packages.

## Requirements

- Git
- GNU Stow

## Neovim

From this repository's root, apply the Neovim configuration with:

```sh
stow --target="$HOME" nvim
```

This creates `~/.config/nvim` as a link to `nvim/.config/nvim` in this repository.

To remove the package from the home directory:

```sh
stow --target="$HOME" --delete nvim
```

## Adding another application

Each application should be a separate Stow package. Mirror the paths it needs
under the package directory, then apply it from the repository root. For
example, a future tmux package can contain `tmux/.tmux.conf`, and a future
Git package can contain `git/.config/git/config`.

Preview changes before applying them with:

```sh
stow --target="$HOME" --simulate --verbose nvim
```
