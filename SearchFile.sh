#!/bin/bash

# Set the directory to search in
search_directory="/g/data/xe2/"

# Set the search pattern
search_pattern="*chopper*"

# Find files matching the search pattern
matching_files=$(find "$search_directory" -type f -name "$search_pattern")

# Check if any matching files were found
if [ -z "$matching_files" ]; then
  echo "No files containing 'chopper' were found in $search_directory."
else
  echo "Files containing 'chopper' found in $search_directory:"
  echo "$matching_files"
fi