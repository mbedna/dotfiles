#!/bin/sh 
set -vx
tmux new-session -d -s smart 
tmux new-window -t smart:0
tmux new-window -t smart:1
tmux send-keys -t smart:1 'gosmart1' C-m

tmux new-window -t smart:2
tmux send-keys -t smart:2 'gosmart1' C-m

tmux new-window -t smart:3
tmux send-keys -t smart:3 'gosmart2' C-m

tmux new-window -t smart:4
tmux send-keys -t smart:4 'gosmart2' C-m

tmux new-window -t smart:5
tmux send-keys -t smart:5 'gosmart1' C-m
tmux send-keys -t smart:5 'start-smart1.sh' C-m

tmux new-window -t smart:6
tmux send-keys -t smart:6 'godatabase' C-m

tmux new-window -t smart:7

tmux new-window -t smart:8

tmux select-window -t smart:0
tmux -2 attach-session -t smart
