#!/bin/sh 
set -vx
tmux new-session -d -s smart 
tmux new-window -t smart:0
tmux new-window -t smart:1
tmux send-keys -t smart:1 'gosmart' C-m

tmux new-window -t smart:2
tmux send-keys -t smart:2 'gosmart' C-m

tmux new-window -t smart:3
tmux send-keys -t smart:3 'gosmart' C-m

tmux new-window -t smart:4
tmux send-keys -t smart:4 'gosmart' C-m

tmux new-window -t smart:5
tmux send-keys -t smart:5 'gosmart' C-m
tmux send-keys -t smart:5 'foreman start' C-m

tmux new-window -t smart:6
tmux send-keys -t smart:6 'godatabase' C-m

tmux new-window -t smart:7

tmux select-window -t smart:0
tmux -2 attach-session -t smart
