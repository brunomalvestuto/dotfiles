# DOTFILES

Each top-level package mirrors paths relative to your home directory. For
example, `emacs/.config/emacs/init.el` is linked to `~/.config/emacs/init.el`.

## Requirements

- Git and GNU Stow (the installer uses Bash).
- The applications whose packages you select.
- For Zsh, the existing configuration expects oh-my-zsh and asdf, plus
  `XDG_CONFIG_HOME`, `XDG_DATA_HOME`, and `XDG_STATE_HOME` to be set before loading
  it (usually `~/.config`, `~/.local/share`, and `~/.local/state`). To load the Zsh
  files from their existing location, set `ZDOTDIR="$HOME/.config/zsh"` in your
  shell startup environment. The packaged `.zshenv` is empty and does not set
  these variables for you.

## Install

Clone a regular working tree, including the Chemacs and Spacemacs submodules:

```bash
git clone --recurse-submodules https://github.com/brunomalvestuto/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install --simulate
./install
```

For an existing checkout, initialize the submodules with
`git submodule update --init --recursive` first. The installer works from any
working directory and always targets `$HOME`.

Available packages are `alacritty`, `chemacs`, `emacs`, `fonts`, `spacemacs`,
`tmux`, `vim`, and `zsh`. With no package names, the installer selects all of
them. To install only selected packages:

```bash
./install --simulate emacs tmux
./install emacs tmux
```

`chemacs` supplies `~/.emacs.d` and the profile configuration. Its default
profile uses the `emacs` package; its Spacemacs profile uses the `spacemacs`
package, which supplies both `~/spacemacs` and `~/.config/spacemacs`.

The installer checks all selected packages for conflicts before creating links.
Existing files are never adopted, moved, or overwritten. If a conflict is
reported, review and back up the conflicting file outside its destination,
then retry. Re-running installation preserves links already managed by Stow.
The installer keeps target directories as directories and excludes `.git*`
metadata, including submodule Git files.

## Remove links

Run from the repository, selecting the packages to unstow:

```bash
stow --dir="$PWD" --target="$HOME" --no-folding --delete emacs tmux
```

Unstowing removes managed links and leaves the package files in this repository.
After installing fonts, run `fc-cache -f` if needed to refresh the font cache.

## Migrating from the bare Git setup

This layout replaces the previous `~/.dotfiles` bare repository and home-directory
checkout. The Zsh `config` alias and Emacs dotfiles Magit shortcut now use the
regular repository at `~/dotfiles`. Review and back up files from the old setup
before replacing them with Stow links; the installer does not migrate live files
automatically.
