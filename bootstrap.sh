#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
DOTFILES_ROOT=$(pwd -P)

info() {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user() {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link() {
  local src=$1 dst=$2
	mkdir -pv "${dst}"

	if [ -d $src ]; then
		for rel in $(git -C "${src}" ls-files --cached --others --exclude-standard); do
			mkdir -pv "$(dirname "${dst}/${rel}"})"
			ls -sfnv "${src}/${rel}" "${dst}/${rel}"
		done
	else
		ls -sfnv "${src}" "${dst}"
	fi
}

main() {
  local overwrite_all=false backup_all=false skip_all=false

  link "$DOTFILES_ROOT/.gitconfig" "$HOME/.gitconfig"
  link "$DOTFILES_ROOT/.bashrc" "$HOME/.bashrc"
  link "$DOTFILES_ROOT/.bash_profile" "$HOME/.bash_profile"
  # link "$DOTFILES_ROOT/.aliases" "$HOME/.aliases"
  # link "$DOTFILES_ROOT/.exports" "$HOME/.exports"
  # link "$DOTFILES_ROOT/.functions" "$HOME/.functions"

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    link "$DOTFILES_ROOT/local" "$HOME/.local"
    link "$DOTFILES_ROOT/config" "$HOME/.config"

  elif [[ "$OSTYPE" == "darwin"* ]]; then
    link "$DOTFILES_ROOT/local" "$HOME/local"
    link "$DOTFILES_ROOT/config" "$HOME/.config"

  # elif [[ "$OSTYPE" == "cygwin" ]]; then
  #         # POSIX compatibility layer and Linux environment emulation for Windows
  # elif [[ "$OSTYPE" == "msys" ]]; then
  #         # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  # elif [[ "$OSTYPE" == "win32" ]]; then
  #         # I'm not sure this can happen.
  # elif [[ "$OSTYPE" == "freebsd"* ]]; then
  #         # ...
  else
    fail "OSTYPE ($OSTYPE) does not match any config"
  fi
}

main
