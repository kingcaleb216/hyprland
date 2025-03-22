#!/bin/bash

# Function to backup existing config and symlink to repo
function setLink()
{
   path=$1
   name=$(basename $path)

   # If modifying in a root directory
   if [[ $path =~ "etc" ]]
   then
      doAs="sudo"
   else
      doAs=""
   fi
   
   # If a symlink already exists
   if [[ -L $path ]]
   then
      # If the link is already set to the same location
      if [[ $(readlink -f $path) == $repo/$name ]]
      then
	 # Quit function but continue script
	 echo "Already linked: $name"
         return
      fi

      echo "Unlinking current $name"
      $doAs unlink $path

   # If configuration already exists
   elif [[ -f $path ]] || [[ -d $path ]]
   then
      backup=$path.$timestamp.hyprApply

      echo "Backing up $name to $backup"
      $doAs mv $path $backup
   fi

   # Make sym link from repo to system
   echo "Linking $name"
   $doAs ln -s $repo/$name $path
}

repo=$(dirname $(realpath $0))
timestamp=$(date +%Y-%m-%d_%H-%M-%S)

# Make .config in case it doesn't exist
mkdir "$HOME/.config" 2>/dev/null

setLink "$HOME/.config/hypr" 
setLink "$HOME/.config/waybar"
setLink "$HOME/.config/kitty"
setLink "$HOME/.config/rofi"
setLink "$HOME/.config/swww"
setLink "$HOME/.config/systemd"
setLink "$HOME/.bashrc"

# If running Arch
if [[ $(cat /etc/os-release) =~ "Arch" ]]
then
   # If the -l flag has not been set
   if ! [[ $1 == "-l" ]]
   then
      setLink "/etc/pacman.d/hooks"

      # Update system and install packages
      sudo pacman -Syu --needed --noconfirm $(cat $repo/archPackages)
   fi
fi

