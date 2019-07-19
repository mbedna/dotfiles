#!/bin/sh 
set -vx
tmux new-session -d -s most -n 'main'
#tmux new-window -n 'main' -t most:0
tmux new-window -n 'busi' -t most:1
tmux send-keys -t most:1 'gomostbusiness' Enter

tmux new-window -n 'impo' -t most:2
tmux send-keys -t most:2 'gomostimporterbusiness' Enter

tmux new-window -n 'exte' -t most:3
tmux send-keys -t most:3 'gomostexternalconnectorbusiness' Enter

tmux new-window -n 'aggr' -t most:4
tmux send-keys -t most:4 'gomostaggregatorbusiness' Enter 

tmux new-window -n 'logs' -t most:5
tmux send-keys -t most:5 'tailall' Enter

tmux new-window -n 'elas' -t most:6

tmux new-window -n 'moja' -t most:7
tmux send-keys -t most:7 'gomojapg' Enter

tmux new-window -n 'idea' -t most:8

tmux select-window -t most:0
tmux -2 attach-session -t most
