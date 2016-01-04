#!/bin/sh 
set -vx
tmux new-session -d -s defra 
tmux new-window -t defra:0
tmux new-window -t defra:1
tmux send-keys -t defra:1 'goprojects' C-m
tmux new-window -t defra:2
tmux send-keys -t defra:2 'goprojects' C-m
tmux new-window -t defra:3
tmux send-keys -t defra:3 'goprojects' C-m
tmux new-window -t defra:4
tmux send-keys -t defra:4 'goprojects' C-m
tmux new-window -t defra:5
tmux send-keys -t defra:5 'goproject' C-m
tmux send-keys -t defra:5 'foreman start' C-m
tmux new-window -t defra:6
tmux send-keys -t defra:6 'godatabase' C-m
tmux new-window -t defra:7
tmux send-keys -t defra:7 'goops' C-m
tmux send-keys -t defra:7 'startnginx' C-m

tmux select-window -t defra:0
tmux -2 attach-session -t defra
