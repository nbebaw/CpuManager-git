#!/bin/bash
#Created by Nader
#This program created to help you to turn your turbo boost off and on.
if [[ $EUID -ne 0 ]]; then
        RED='\033[0;31m'	
	echo -e "${RED}This script must be run as root."
	exit 1
fi
echo "Turbo Boost"
echo "1- Turn off"
echo "2- Turn on"
read -p "Your choice:" choice
look_at=$(cat /sys/devices/system/cpu/intel_pstate/no_turbo) 
package=$(pacman -Q zenity)

#check if zenity is installed 
if [[ $? -ne 0 ]]
then 
	RED='\033[0;31m'
	echo -e "${RED}Dependecy: Zenity Package"
	sudo pacman -S zenity
fi
#Turbo Boost turn off
if [[ $choice -eq 1 ]] && [[ $look_at -eq 0 ]]
then 
	echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
	zenity --info --width=400 --height=200 --text  "Turbo Boost is now off"

elif [[ $choice -eq 1 ]] && [[ $look_at -eq 1 ]]
then

	zenity --info --width=400 --height=200 --text "Turbo Boost is already off"
fi

#Turbo Boost turn on
if [[ $choice -eq 2 ]] && [[ $look_at -eq 1 ]]
then
	echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo
	zenity --info --width=400 --height=200 --text "Turbo Boost is now on"

elif [[ $choice -eq 2 ]] && [[ $look_at -eq 0 ]]
then
	zenity --info --width=400 --height=200 --text "Turbo Boost is already on"
fi

# CpuManager-git
