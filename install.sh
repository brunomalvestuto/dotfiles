#!/bin/sh

for name  in dot/* ; do
  target="$HOME/.`basename $name`"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
      echo Backuping file $target to "$target"_old
      mv $target $(target)_old
    fi
  else
    echo "Symlinking  $target"
    ln -s "$PWD/$name" "$target"
  fi
done

vundle_dir=~/.vim/bundle/vundle
echo "Checking for vundle: "
if [ ! -d "$vundle_dir" ]; then
  echo "Vundle was not found cloning it"
  git clone https://github.com/gmarik/vundle.git  $vundle_dir
else
  echo vundle already in place
fi

solarized_dir=~/solarized
echo "Checking for solarized: "
if [ ! -d "$solarized_dir" ]; then
  echo "Solarized was not found cloning it"
  git clone https://github.com/altercation/solarized.git $solarized_dir
else
  echo vundle already in place
fi

if ! type "brew" > /dev/null 2>&1; then
  echo "Homebrew was not found, please install homebrew to continue: http://brew.sh/"
  exit;
else
  echo "Updating brew formulas, it may take few minutes."
  brew update

  echo "Installing required brew formulas."
  brew bundle
fi

vim -u ~/.vimrc.bundles +BundleInstall +qa
