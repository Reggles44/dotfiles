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

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then

      local currentSrc="$(readlink $dst)"
      if [ "$currentSrc" == "$src" ]; then

        skip=true

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
        o)
          overwrite=true
          ;;
        O)
          overwrite_all=true
          ;;
        b)
          backup=true
          ;;
        B)
          backup_all=true
          ;;
        s)
          skip=true
          ;;
        S)
          skip_all=true
          ;;
        *) ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]; then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]; then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]; then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]; then # "false" or empty
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi

}

main() {
  local overwrite_all=false backup_all=false skip_all=false

  link "$DOTFILES_ROOT/.gitconfig" "$HOME/.gitconfig"
  link "$DOTFILES_ROOT/.zshrc" "$HOME/.zshrc"

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    link "$DOTFILES_ROOT/bin" "$HOME/bin"
    link "$DOTFILES_ROOT/kitty" "$HOME/.config/kitty"
    link "$DOTFILES_ROOT/nvim" "$HOME/.config/nvim"
    link "$DOTFILES_ROOT/tmux" "$HOME/.config/tmux"

  elif [[ "$OSTYPE" == "darwin"* ]]; then
    link "$DOTFILES_ROOT/bin" "$HOME/bin"
    link "$DOTFILES_ROOT/kitty" "$HOME/.config/kitty"
    link "$DOTFILES_ROOT/nvim" "$HOME/.config/nvim"
    link "$DOTFILES_ROOT/tmux" "$HOME/.config/tmux"
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
