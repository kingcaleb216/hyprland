#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# User aliases
alias ll="ls -la"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias ch="vim ~/.config/hypr/hyprland.conf"
alias cw="vim ~/.config/waybar/config.jsonc"
alias cws="vim ~/.config/waybar/style.css"
alias ck="vim ~/.config/kitty/kitty.conf"
alias repo="cd /opt/repos"
alias rh="cd /opt/repos/hyprland"
alias fetch="clear && fastfetch"

# User functions
function cd()
{
   builtin cd $1
   ll
}

# Graphics
export WLR_RENDERER=vulcan
export LIBVA_DRIVER_NAME=v3d
