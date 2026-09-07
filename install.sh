#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
DOTFILES_ROOT=$(pwd -P)

link() {
  local src=$1 dst=$2

  # If the destination is a link remove it
  if [[ -L "${dst}" ]]; then
    rm -fv "${dst}"
  fi

  # If the source if a directory iterate over it to find all filtes to link
  if [ -d $src ]; then
    mkdir -pv "${dst}"
    for rel in $(git -C "${src}" ls-files --cached --others --exclude-standard); do
      mkdir -pv "$(dirname "${dst}/${rel}")"
      ln -sfnv "${src}/${rel}" "${dst}/${rel}"
    done

  # If source is not a directory just link
  else
    ln -sfnv "${src}" "${dst}"
  fi
}

echo ' '
echo '--------------------------------------------------'
echo "Pre Install"
echo '--------------------------------------------------'

echo ' '
echo '--------------------------------------------------'
echo "LINKING Dotfiles"
echo '--------------------------------------------------'

link "$DOTFILES_ROOT/.gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_ROOT/.bashrc" "$HOME/.bashrc"
link "$DOTFILES_ROOT/.bash_profile" "$HOME/.bash_profile"
link "$DOTFILES_ROOT/local" "$HOME/local"
link "$DOTFILES_ROOT/config" "$HOME/.config"

echo ' '
echo '--------------------------------------------------'
echo "Post Install"
echo '--------------------------------------------------'

curl -fsSL https://mise.run/bash | sh
eval "$(mise activate bash)"
mise install
