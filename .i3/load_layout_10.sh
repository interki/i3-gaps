#!/bin/bash

#i3-msg "$workspace1; append_layout ~/.i3/workspace-1.json"
i3-msg 'workspace 10:  Media; append_layout /home/arch/.i3/workspace_10.json'

#(terminator &)
#(terminator &)
#(terminator &)

(terminator --role 10.1 -e 'w3m google.com; bash' &)   
(terminator --role 10.2 -e 'weechat; bash' &)
(terminator --role 10.3 -e 'mpsyt; bash' &)
(terminator --role 10.4 -e 'newsbeuter; bash' &)   
(terminator --role 10.5 -e 'podbeuter; bash' &)