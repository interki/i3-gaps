# Created by newuser for 5.2

autoload -Uz colors && colors
alias ls='ls -a --color=auto'
alias l='ls -a --color=auto'
alias grep='grep --color=auto'
#alias ssh='ssh -R 10999:localhost:22'
alias c='clear'

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
