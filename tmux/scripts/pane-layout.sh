#!/usr/bin/env bash

# tmux new-window -t $session_name:1
# tmux rename-window -t $session_name:1 Layout
# tmux select-windows -t $session_name:1 

echo "hello"
tmux select-pane -t 1

tmux split-window -h -l '20%'

tmux select-pane -t 2

tmux split-window -v -l '30%'

