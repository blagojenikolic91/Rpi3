#!/bin/bash

echo
echo "Welcome to $(tput bold)$(tput setaf 5)Rpi3$(tput sgr0) Script, created by $(tput bold)$(tput setaf 6)blnLabs$(tput sgr0)"
echo
echo "$USER"

echo "=========================================================="
echo "---------------- Required packages are -------------------"
echo "=========================================================="
echo

echo "		i3       - Tiling Windows manager"
echo "		feh      - Image viewer and i3 wallpaper add"
echo "		conky    - Wiget application "
echo "		rofi     - Finder application "
echo "		st       - Simple Terminal - Terminal Emulator "


apt update > /dev/null

for package in vim i3 screenfetch feh conky-all rofi stterm neofetch
do

apt install $package -y

done

sudo -u pi pip install --user dmenu-hotkeys
sudo -u pi /home/pi/.local/bin/dmenu_hotkeys copy-config

echo "=========================================================="
echo "------------------ Copy Wallpaper Dir --------------------"
echo "=========================================================="
echo

mkdir /home/pi/.config/wallpapers
cp wallpaper/* /home/pi/.config/wallpapers
chown -R pi:pi /home/pi/.config/wallpapers

echo "=========================================================="
echo "-------------------- Copy i3 Config ----------------------"
echo "=========================================================="
echo

mkdir -p /home/pi/.config/i3
cp config/i3.config /home/pi/.config/i3/config
chown -R pi:pi /home/pi/.config/i3

cp /etc/xdg/lxsession/LXDE-pi/desktop.conf /etc/xdg/lxsession/LXDE-pi/desktop.conf.bak
sed -i.bak 's/window_manager=mutter/window_manager=i3/g' /etc/xdg/lxsession/LXDE-pi/desktop.conf

cp /etc/environment /etc/environment.bak
rm -f /etc/environment 
echo 'LIBGL_ALWAYS_SOFTWARE=true' > /etc/environment 

cp /etc/xdg/lxsession/LXDE-pi/autostart /etc/xdg/lxsession/LXDE-pi/autostart.bak

echo "@lxpanel --profile LXDE-pi" > /etc/xdg/lxsession/LXDE-pi/autostart


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



