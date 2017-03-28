import os
import subprocess
import sys


os.chdir('/etc/pacman.d/') 

if os.path.isfile('mirrorlist.pacnew'):
    print("mirrorlist.pacnew exits")
else:
    print("mirrorlist.pacnew doesn't exist")
    exit

os.remove('mirrorlist.back')
os.rename('mirrorlist', 'mirrorlist.back')
os.rename('mirrorlist.pacnew', 'mirrorlist')

cmd = "reflector --verbose -l 200 -p http --sort rate --save mirrorlist"
failure = os.system(cmd)
if failure:
    print("Execution of '%s' failed!\n" % cmd)
    exit

# #test
# os.chdir('/etc/pacman.d/') 

# if os.path.isfile('mirrorlist.pacnew1'):
#     print(".pacnew exits")
# else:
#     print("mirrorlist.pacnew doesn't exist")
#     exit

# os.remove('mirrorlist.back1')
# os.rename('mirrorlist1', 'mirrorlist.back1')
# os.rename('mirrorlist.pacnew1', 'mirrorlist1')
