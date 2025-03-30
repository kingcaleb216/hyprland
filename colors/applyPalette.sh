#!/bin/bash
source ~/.config/colors/palette

### Generate Kitty theme
cat > ~/.config/kitty/colors.conf <<EOF
color0  #$black
color1  #$red
color2  #$green
color3  #$yellow
color4  #$blue
color5  #$magenta
color6  #$cyan
color7  #$white
color8  #$light_black
color9  #$light_red
color10 #$light_green
color11 #$light_yellow
color12 #$light_blue
color13 #$light_magenta
color14 #$light_cyan
color15 #$light_white
EOF

### Generate Hyprland env vars
cat > ~/.config/hypr/colors.conf <<EOF
\$black = 0xee$black
\$red = 0xee$red
\$green = 0xee$green
\$yellow = 0xee$yellow
\$blue = 0xee$blue
\$magenta = 0xee$magenta
\$cyan = 0xee$cyan
\$white = 0xee$white
\$light_black = 0xee$light_black
\$light_red = 0xee$light_red
\$light_green = 0xee$light_green
\$light_yellow = 0xee$light_yellow
\$light_blue = 0xee$light_blue
\$light_magenta = 0xee$light_magenta
\$light_cyan = 0xee$light_cyan
\$light_white = 0xee$light_white
EOF

### Generate Waybar colors
cat > ~/.config/waybar/colors.css <<EOF
@define-color black #$black;
@define-color red #$red;
@define-color green #$green;
@define-color yellow #$yellow;
@define-color blue #$blue;
@define-color magenta #$magenta;
@define-color cyan #$cyan;
@define-color white #$white;
@define-color light_black #$light_black;
@define-color light_red #$light_red;
@define-color light_green #$light_green;
@define-color light_yellow #$light_yellow;
@define-color light_blue #$light_blue;
@define-color light_magenta #$light_magenta;
@define-color light_cyan #$light_cyan;
@define-color light_white #$light_white;
EOF

# Restart hyprland
hyprctl reload

