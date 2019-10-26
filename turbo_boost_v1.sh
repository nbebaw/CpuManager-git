#!/bin/bash
#Created by Nader
#This program created to help you to turn your turbo boost off and on. 
echo "You have to run this program with sudo"
echo "Turbo Boost"
echo "1- Turn off"
echo "2- Turn on"
read -p "Your choice:" choice
look_at=$(cat /sys/devices/system/cpu/intel_pstate/no_turbo) 

#Turbo Boost turn off
if [[ $choice -eq 1 ]] && [[ $look_at -eq 0 ]]
then 
	echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
	echo "Turbo Boost is now off"
elif [[ $choice -eq 1 ]] && [[ $look_at -eq 1 ]]
then
	echo "Turbo Boost is already off"
fi

#Turbo Boost turn on
if [[ $choice -eq 2 ]] && [[ $look_at -eq 1 ]]
then
	echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo
	echo "Turbo Boost is now on"

elif [[ $choice -eq 2 ]] && [[ $look_at -eq 0 ]]
then
	echo "Turbo Boost is already on"
fi

#notify-send 'Turbo Boost is now off' 'This option will be deactivated after restart your system' --icon=diablog-information
