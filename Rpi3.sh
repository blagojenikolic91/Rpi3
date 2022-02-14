#!/bin/bash

echo
echo "Welcome to $(tput bold)$(tput setaf 5)Rpi3$(tput sgr0) Script, created by $(tput bold)$(tput setaf 6)blnLabs$(tput sgr0)"
echo

echo "=========================================================="
echo "---------------- Required packages are -------------------"
echo "=========================================================="
echo

echo "		i3		- Tiling Windows manager"
echo "		feh		- Image viewer and i3 wallpaper add"

apt update > /dev/null

for package in vim i3 screenfetch feh
do

apt install $package -y

done

# >> script.log 2>>script_error.log

# Example for colored output

#echo -e "$(tput bold) reg  bld  und   tput-command-colors$(tput sgr0)"
 
#for i in $(seq 1 7); do
#	  echo " $(tput setaf $i)Text$(tput sgr0) $(tput bold)$(tput setaf $i)Text$(tput sgr0) $(tput sgr 0 1)$(tput setaf $i)Text$(tput sgr0)  \$(tput setaf $i)"
#done
   
#echo ' Bold            $(tput bold)'
#echo ' Underline       $(tput sgr 0 1)'
#echo ' Reset           $(tput sgr0)'
#echo



