#!/bin/bash

while true
do
	mv ~/.watch/current ~/.watch/past
	ls -1A ~/Files/Convert > ~/.watch/current
	diff --changed-group-format='%>' --unchanged-group-format='' ~/.watch/past ~/.watch/current > ~/.watch/NewFiles
	
	while read line
	do
		if test -f /media/sdv1/camplab/Files/Convert/$line
		then                                   
			
			~/.ffmpeg/./MP4.sh ~/Files/Convert/$line 
		
			echo $line > delete

		else
			mkdir ~/.watch/$line
		fi


	done <~/.watch/NewFiles



	sleep 20
done
