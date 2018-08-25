#!/bin/bash

# Variables for the FFMPEG watch folder:
WATCHFOLDER=~/Files/Convert
FFMPEGSCRIPT=~/.ffmpeg/./MP4.sh
DELAY=20


while true
do
	# Moves the current file list to the past file list. 
	mv ~/.watch/current ~/.watch/past
	
	# Gets current list form the working directoy and writes it to the file called current 	
	ls -1A $WATCHFOLDER > ~/.watch/current

	# Compares the two documents "curent" and "past" and adds file paths to document called "NewFiles"
	diff --changed-group-format='%>' --unchanged-group-format='' ~/.watch/past ~/.watch/current > ~/.watch/NewFiles
	
	while read line
	do
		# Tests to see if the new item is a file or directory
		if test -f /media/sdv1/camplab/Files/Convert/$line
		then                                   
			# This is where the actual part of video conversion happends. You can replace this next line with the following
			# "ffmpeg -i $line [output file options] $( basename "$file" ) += ".mp4""
			# Alternatively, use the line below which makes a call for a new script that will handle file naming and output 			  file options
			~/.ffmpeg/./MP4.sh ~/Files/Convert/$line 
		
			echo $line > delete
			# This is not working right now but will in the future. The idea is that the file path is added to a new                                  documentt where another process will delete old files from the watch folder

		else
			# This needs work.. not sure what my intentions were with this one
			mkdir ~/.watch/$line
		fi


	done <~/.watch/NewFiles

	# This is the delay in watch folder checks. Please assign above
	sleep $DELAY
done
