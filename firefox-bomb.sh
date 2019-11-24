#!/bin/bash
# Bash Script to open multiple random websites from a list of provided websites in firefox.
# Author : wh0am1
# GitHub : https://github.com/wh0th3h3llam1


# Usage : 
# $./firefox-bomb.sh

if [[ -f websites ]] && . websites
then
	source websites
else
	list=('google.com' 'fb.com' 'linkedin.com' 'instagram.com' 'duckduckgo.com' 'github.com' 'stackoverflow.com' 'apple.com' 'microsoft.com' 'mozilla.org' 'youtube.com' 'mediafire.com' 'theguardian.com' 'dropbox.com' 'amazon.com' 'serverfault.com' 'blogger.com' 'mongodb.com' 'hp.com' 'photos.google.com' 'gmail.com' 'protonmail.com' 'superuser.com' 'nikon.com' 'canon.com')
fi

size_of_list=" ${#list[@]} "


printf "Enter Delay in Seconds (Default Value is 0.5 Sec): "
read delay

# Check if user input is null.
# If null, then it will assign 1 as default to delay variable.
if [ -z $delay ]
then
	delay=0.5
fi

count=0

while(true);
do
	random_site=$(( $RANDOM % $size_of_list ))

	selected_site=${list[$random_site]}

	firefox --new-tab $selected_site

	echo $selected_site

	count=`expr $count + 1`
	echo "Websites Opened : "$count

	sleep $delay;
done


#wh0am1
