#!/usr/bin/env bash

# mise install
curl https://mise.run | MISE_QUIET=1 sh

# use mise to install tools
mise use --global --yes \
  neovim@0.11.4 starship \
  jq fzf lazydocker lazygit ruff \
  opentofu terragrunt kubectl k3d kubectx \
  python npm node golang rust zig gradle java

# auto completion
mise use --global usage
