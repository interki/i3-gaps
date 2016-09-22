#! /bin/bash

tmux start-server
tmux new-session -s Scratch -n edit -c ~/ -x 82 -y 47 -d
tmux send-keys -t Scratch:edit 'v' 'i' 'm' ' ' '-' 'u' ' ' '~' '/' '.' '0' 'v' 'i' 'm' 'r' 'c' 'Enter'
tmux attach -t Scratch

