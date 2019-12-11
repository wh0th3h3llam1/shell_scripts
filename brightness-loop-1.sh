#!/bin/sh

# Bash Script to set a brightness loop (just for fun).
# Doesn't work for Multiple Displays.
# Author : wh0am1
# GitHub : https://github.com/wh0th3h3llam1


function brightness_loop()
{
	lowest_value=2
	highest_value=100
	current_value=$highest_value
	direction=-1
	printf "Enter Delay in Seconds (Default Value is 0.01 Sec): "
	read delay

	# Check if user input is null.
	# If null, then it will assign 1 as default to delay variable.
	if [ -z $delay ]
	then
		delay=0.01
	fi

	while(true);
	do
		if [[ $current_value -lt $lowest_value || $current_value -gt $highest_value ]];
		then
			direction=$( expr $direction \* -1 )
		fi

		current_value=$( expr $current_value + $direction )

		level="$( echo "scale=2; $current_value/100" | bc )"

		xrandr --output $display --brightness $level

		sleep $delay
	done
}

display="$( xrandr | grep -w "connected" | cut -f1 -d " " ) "

brightness_loop
