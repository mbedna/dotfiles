#!/bin/sh 
set -vx
tmux new-session -d -s most 
tmux new-window -n 'main' -t most:0
tmux new-window -n 'most1' -t most:1
tmux send-keys -t most:1 'gomostbusiness' C-m

tmux new-window -n 'most1' -t most:2
tmux send-keys -t most:2 'gomost' C-m

tmux new-window -n 'most1' -t most:3
tmux send-keys -t most:3 'taillogmostbusiness' C-m

tmux new-window -n 'most1' -t most:4
tmux send-keys -t most:4 'taillogmojapgbusiness' C-m

tmux new-window -n 'startmost1' -t most:5
tmux send-keys -t most:5 'gomost1' C-m
tmux send-keys -t most:5 'taillogmojapgportal' C-m

tmux new-window -n 'elastic' -t most:6
tmux send-keys -t most:6 'startelastic' C-m

tmux new-window -n 'idea1' -t most:7

tmux new-window -n 'idea2' -t most:8

tmux select-window -t most:0
tmux -2 attach-session -t most
