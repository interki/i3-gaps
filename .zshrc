# Created by newuser for 5.2

#-shell
autoload -Uz colors && colors
alias ~='cd ~'
alias ls='ls --color=auto'
alias l='ls -a --color=auto'
alias grep='grep --color=auto'
alias c='clear'
# alias ?='bind'
#-fmpeg
alias capture='ffmpeg -f x11grab -video_size 1366x768 -i $DISPLAY -f alsa -i default -c:v ffvhuff -c:a flac ~/Desktop/capture.mkv'
#-network
alias homeshare='sudo mount -t cifs //FREENAS/HOME /mnt/HOME -o user=HOME,uid=arch,gid=wheel,workgroup=workgroup,ip=10.0.0.20,iocharset=utf8'
alias hsync='rsync -r -v --progress -s /home/arch/Documents/sync/ /mnt/HOME/Documents/sync'
#-system
alias update='yaourt -Syu --aur'
alias restart='sudo shutdown -r now'
alias shutdown='sudo shutdown now'
#-tmux
alias ltp="ruby ~/.tmux-profiles/load-tmux-profile.rb"
alias tmuxa='tmux attach-session -t'
alias tmuxk='tmux kill-session'
alias tmuxka='tmux kill-server'
alias tmuxl='tmux list-session'
#-sort mirrors by top 5 existing//top 200 reciently updated
alias 'sortmirror-s'='sudo reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias 'sortmirror-l'='sudo reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist'
#-git
alias 'commit'='git commit -am "up"'
#-ssh
#set $iprange = 10.0.0.
alias db-pihole='dbclient debian@10.0.0.55'
alias db-fnas='dbclient SHOME@10.0.0.20'
alias db-squid='dbclient bsd@10.0.0.75'
alias db-wbserv='dbclient bsd@10.0.0.85'
#-media
# alias livestreamer='livestreamer -p vlc'
# alias pass='--player-passthrough hls'
alias twitch='twitch-curses'
##-alias take input test 
# alias fish='echo -n "Enter IP: " && read IP && ping $IP'
alias livestreamer='echo -n "Enter URL: " && read URL && streamlink -p vlc $URL high --player-passthrough hls'
#-googler
alias g='googler'
alias gg='googler -n 5'
alias gn='googler -N'
#archpad
alias pad='vim /home/arch/.dotfiles/i3/archpad'

#bindkey "${terminfo[khome]}" beginning-of-line
#bindkey "${terminfo[kend]}" end-of-line

bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line

EDITOR="vim"
##################################################

powerline-daemon -q
. /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
# prompt walters
source /home/arch/builds/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# append ls to cd 'ls -F originally'
cd() {
  echo && builtin cd "$@" && l;
}
