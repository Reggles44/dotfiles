# ---------------------------------------
# ALIASES
# ---------------------------------------

# ---------------------------------------
# Environmenet Variables
# ---------------------------------------
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# ---------------------------------------
# Mise
# ---------------------------------------
eval "$(mise activate bash)"

# ---------------------------------------
# FZF
# ---------------------------------------
eval "$(fzf --bash)"

# ---------------------------------------
# Tmux
# ---------------------------------------
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi
