# Created by newuser for 5.2

autoload -Uz colors && colors
alias ls='ls -a --color=auto'
alias l='ls -a --color=auto'
alias grep='grep --color=auto'
#alias ssh='ssh -R 10999:localhost:22'
alias c='clear'
alias livestreamer='livestreamer -p vlc'
alias pass='--player-passthrough hls'
alias capture='ffmpeg -f x11grab -video_size 1366x768 -i $DISPLAY -f alsa -i default -c:v ffvhuff -c:a flac ~/Desktop/capture.mkv'
alias homeshare='sudo mount -t cifs //FREENAS/HOME /mnt/HOME -o user=HOME,uid=arch,gid=wheel,workgroup=workgroup,ip=10.0.0.20,iocharset=utf8'
alias update='sudo yaourt -Syu --aur'
alias restart='sudo shutdown -r now'
alias tmuxa='tmux attach-session -t'


#set $iprange = 10.0.0.

alias db-pihole='dbclient debian@10.0.0.55'
alias db-fnas='dbclient debian@10.0.0.20'
alias db-squid='dbclient bsd@10.0.0.75'
alias db-wbserv='dbclient bsd@10.0.0.85'

alias ltp="ruby ~/.tmux-profiles/load-tmux-profile.rb"

#bindkey "${terminfo[khome]}" beginning-of-line
#bindkey "${terminfo[kend]}" end-of-line

bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line

##################################################

powerline-daemon -q
. /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
# prompt walters
source /home/arch/builds/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
