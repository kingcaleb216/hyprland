#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s expand_aliases

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\e[0;34m󰣇  \u \W >\e[0m '

# Graphics
export WLR_RENDERER=vulcan
export LIBVA_DRIVER_NAME=v3d

# ---------------------------------------------------------------
# User Aliases
# ---------------------------------------------------------------

# Standard
alias ll="ls -la"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias repo="cd /opt/repos"
alias rh="cd /opt/repos/hyprland"
alias fetch="clear && fastfetch"

# Config
alias ch="vim ~/.config/hypr/hyprland.conf"
alias cw="vim ~/.config/waybar/config.jsonc"
alias cws="vim ~/.config/waybar/style.css"
alias ck="vim ~/.config/kitty/kitty.conf"

# Ascii Aliases
alias dwight="~/.config/asciiArt/asciiArt.sh dwight"
alias catbox="~/.config/asciiArt/asciiArt.sh catBox"
alias deer="~/.config/asciiArt/asciiArt.sh deer"
alias squirrel="~/.config/asciiArt/asciiArt.sh deer"
alias ridgecrest="~/.config/asciiArt/asciiArt.sh ridgecrest"
alias arch="~/.config/asciiArt/asciiArt.sh arch"
alias ascii="~/.config/asciiArt/asciiArt.sh"

# ---------------------------------------------------------------
# User functions
# ---------------------------------------------------------------

function cd()
{
   builtin cd $1
   ll
}

