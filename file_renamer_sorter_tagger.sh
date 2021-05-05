#!/bin/bash

#-------------------------
#	filename: fire_renamer_sorter_tagger.sh
#	description: This script renames files 
#-------------------------

echo "This script by NostradmsX started."

file_extension_to_be_renamed=$1
some_description=$2

# creates a temporary file list of files that will be sorted, renamed, and tagged
ls -art *.$file_extension_to_be_renamed > temp_file

IFS=$'\n'       # make newlines the only separator

counter=1;

for i in $(cat < temp_file); do
    # Single-digit gets preceded by zero
    if [ "$counter" -le 9 ]; then
        mv $i 0${counter}_${some_description}.$file_extension_to_be_renamed
    else
        mv $i ${counter}_${some_description}.$file_extension_to_be_renamed
    fi

((counter=counter+1))
done
rm temp_file
echo "Script ended."
