#!/bin/bash

# Function to backup existing config and symlink to repo
function setLink()
{
   path=$1
   name=$(basename $path)
   
   # If a symlink already exists
   if [[ -L $path ]]
   then
      echo "Unlinking current $name"
      unlink $path

   # If configuration already exists
   elif [[ -f $path ]] || [[ -d $path ]]
   then
      backup=$path.$timestamp.hyprApply

      echo "Backing up $name to $backup"
      mv $path $backup
   fi

   # Make sym link from repo to system
   echo "Linking $name"
   ln -s $repo/$name $path
}

repo=$(dirname $(realpath $0))
timestamp=$(date +%Y-%m-%d_%H-%M-%S)

# Make .config in case it doesn't exist
mkdir "$HOME/.config" > /dev/null

setLink "$HOME/.config/hypr" 
setLink "$HOME/.config/waybar"
setLink "$HOME/.config/kitty"
setLink "$HOME/.config/rofi"
setLink "$HOME/.config/swww"
setLink "$HOME/.bashrc"

# If running Arch
if [[ $(cat /etc/os-release) =~ "Arch" ]]
then
   # Update system and install packages
   sudo pacman -Syu --needed --noconfirm $(cat $repo/archPackages)
fi

