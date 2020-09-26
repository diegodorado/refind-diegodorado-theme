#!/bin/bash
path="/boot/efi/EFI/refind"

#Check if root
[[ $EUID -ne 0 ]] && echo "This script must be run as root." && exit 1

clear

# ensure theme folder
mkdir -p "$path/themes" 

#Remove previous installs
echo -n "Deleting older installed versions (if any)"
rm -rf "$path/themes/refind-diegodorado-theme" 
echo " - [DONE]"

#Copy theme setup folders
echo -n "Copying theme to $path/themes"
cp -r . "$path/themes/refind-diegodorado-theme"
echo " - [DONE]"

#Edit refind.conf - remove older themes
echo -n "Removing old themes from refind.conf"
# ^\s*include matches lines starting with any nuber of spaces and then include.
sed --in-place=".bak" 's/^\s*include/# (disabled) include/' "$path"/refind.conf
echo " - [DONE]"

#Edit refind.conf - add new theme
echo -n "Updating refind.conf"
echo "
# Load rEFInd theme Regular
include themes/refind-diegodorado-theme/theme.conf" | tee -a "$path"/refind.conf &> /dev/null
echo " - [DONE]"
