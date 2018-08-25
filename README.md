# ffwatcher
A bash script that watches for videos added to a directory and then starts converting them with an ffmpeg script

Description of the files and what they do:

	MP4.sh

		This is a script that is called for in the main script {watch.sh}.
		It handles any of the ffmpeg parameters and also deals with file naming.

	NewFiles

		This is a document that is loaded with the new files from each ffwatch run.

	current

		This document is populated with all the files in the current directory
		on each run of ffwatch.

	delete

		This document contains the list of files that have been processed by ffwatch.
	
	past

		This document is a copy of the 'current' document from the last run of ffwatch.

	watch.sh

		This is the main script. Soon will be renamed to ffwatch. If you intend
		to use this, please open and modify this script. At the top you will see
		variables for the watch folder and other settings.
