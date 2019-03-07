#!/bin/sh 
set -vx
tmux new-session -d -s most 
tmux new-window -n 'main' -t most:0
tmux new-window -n 'business' -t most:1
tmux send-keys -t most:1 'gomostbusiness' C-m

tmux new-window -n 'importer' -t most:2
tmux send-keys -t most:2 'gomostimporterbusiness' C-m

tmux new-window -n 'connector' -t most:3
tmux send-keys -t most:3 'gomostexternalconnectorbusiness' C-m

tmux new-window -n 'aggregator' -t most:4
tmux send-keys -t most:4 'gomostaggregatorbusiness' C-m

tmux new-window -n 'logs' -t most:5
tmux send-keys -t most:5 'tailall' C-m

tmux new-window -n 'elastic' -t most:6

tmux new-window -n 'mojapg' -t most:7
tmux send-keys -t most:7 'gomojapg' C-m

tmux new-window -n 'idea2' -t most:8

tmux select-window -t most:0
tmux -2 attach-session -t most
