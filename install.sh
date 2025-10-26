#!/usr/bin/env bash

# mise install
curl https://mise.run | MISE_QUIET=1 sh

# use mise to install tools
mise use --global --yes neovim@0.11.4
mise use --global --yes starship
mise use --global --yes jq
mise use --global --yes fzf
mise use --global --yes lazydocker
mise use --global --yes lazygit
mise use --global --yes ruff

mise use --global --yes opentofu
mise use --global --yes terragrunt
mise use --global --yes kubectl
mise use --global --yes k3d
mise use --global --yes kubectx

mise use --global --yes python
mise use --global --yes npm
mise use --global --yes node
mise use --global --yes golang
mise use --global --yes rust
mise use --global --yes zig
mise use --global --yes gradle
mise use --global --yes java

# auto completion
mise use --global usage
