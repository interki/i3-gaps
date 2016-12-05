#!/bin/bash

#i3-msg "$workspace1; append_layout ~/.i3/workspace-1.json"
#i3-msg 'workspace 10:  Media; append_layout /home/arch/.config/i3/workspace_10a.json'
# i3-msg 'workspace 9: imux; exec terminator --role vimux --command=~/.i3/tbash.sn'
#i3-msg 'workspace 9: imux'
i3-msg 'workspace 9: imux; append_layout /home/arch/.i3/workspace_9.json'


(terminator --role vimux --command=/home/arch/.i3/tbash.sh &)
# (terminator --role vimux --command=/home/arch/.dotfiles/i3/.i3/vimuxbash.sh &)
# (terminator --role vimux &) 
#(terminator &)

# (tmux start-server &)
# (tmux new-session -s Vi -n staging -c ~/ -x 166 -y 47 -d &)
# (tmux new-window -t Vi -n production -c ~/ -d &)
# (tmux new-window -t Vi -n editor -c ~/ -d &)
# (tmux split-window -t Vi:staging -c ~/ -h &)
# (tmux split-window -t Vi:production -c ~/ -h &)
# (tmux send-keys -t Vi:editor 'v' 'i' 'm' 'Enter' &)
# (tmux split-window -t Vi:editor -c ~/ -v  -l 5 &)
# (tmux split-window -t Vi:editor -c ~/ -h &)
# (tmux attach -t V &)