#!/bin/bash

#i3-msg "$workspace1; append_layout ~/.i3/workspace-1.json"
#i3-msg 'workspace 10:  Media; append_layout /home/arch/.config/i3/workspace_10a.json'
i3-msg 'workspace 1:  Terminal; append_layout /home/arch/.config/i3/workspace.json'

#(terminator &)
#(terminator &)
#(terminator &)

exec_always terminator --role 1.2 -e 'ranger; zsh'                                                                          
exec_always terminator --role 1.3 -e 'htop; bash -l' #'nmtui-connect; bash -l' #nmtui #'ssh bsd@192.168.0.19' #; bash -l'    
exec_always terminator --role 1.1 -e 'tmux -u' #vim ~/.vimrc'" #; bash' #.config/i3/config         





