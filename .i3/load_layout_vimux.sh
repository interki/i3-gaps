#!/bin/bash

#i3-msg "$workspace1; append_layout ~/.i3/workspace-1.json"
#i3-msg 'workspace 10:  Media; append_layout /home/arch/.config/i3/workspace_10a.json'
# i3-msg 'workspace 9: imux; exec terminator --role vimux --command=~/.i3/tbash.sn'
i3-msg 'workspace 9: imux'

#(terminator &)
#(terminator &)
#(terminator &)

(terminator --role vimux --command=/home/arch/.i3/tbash.sh &)
# (terminator --role vimux --command=/home/arch/.i3/vimuxbash.sh; zsh &)
# (terminator --role vimux --command='ruby ~/.tmux-profiles/load-tmux-profile.rb main; zsh' &)

# (terminator --role 1.2 -e 'ranger; zsh' &)                                                                          
# (terminator --role 1.3 -e 'htop; bash -l' &) #'nmtui-connect; bash -l' #nmtui #'ssh bsd@192.168.0.19' #; bash -l'    
# (terminator --role 1.1 -e 'tmux -u; zsh' &) #vim ~/.vimrc'" #; bash' #.config/i3/config         




