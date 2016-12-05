#! /bin/bash

tmux start-server
tmux new-session -s Vi -n staging -c ~/ -x 166 -y 47 -d
tmux new-window -t Vi -n production -c ~/ -d
tmux new-window -t Vi -n editor -c ~/ -d
tmux split-window -t Vi:staging -c ~/ -h
tmux split-window -t Vi:production -c ~/ -h
tmux send-keys -t Vi:editor 'v' 'i' 'm' 'Enter'
tmux split-window -t Vi:editor -c ~/ -v  -l 5
tmux split-window -t Vi:editor -c ~/ -h
tmux attach -t Vi

