#!/bin/bash

#i3-msg "$workspace1; append_layout ~/.i3/workspace-1.json"
i3-msg 'workspace 10:  Media; append_layout /home/arch/.config/i3/workspace_10a.json'

#(terminator &)
#(terminator &)
#(terminator &)

#(terminator --transient_for mpsyt  &) 
#(terminator --role 10.1 -e 'cvlc' &)    
#(vlc --role 10.1 --class "vlc"  &)    
(terminator --role 10.2 -e 'mpsyt; bash' &)
(terminator --role 10.3 -e 'newsbeuter; bash' &)   
(terminator --role 10.4 -e 'podbeuter; bash' &)
