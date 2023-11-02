#!/bin/bash
# straight from ChatGPT basically
# moves files within the given input directory into same-named folders

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Get the absolute path of the input directory
input_directory=$(realpath "$1")

# Check if the provided argument is a directory
if [ ! -d "$input_directory" ]; then
    echo "Error: The provided argument is not a directory."
    exit 2
fi

# Iterate over each file in the directory
find "$input_directory" -maxdepth 1 -type f | while read -r file; do
    # Get the file name without extension and the directory name
    file_name=$(basename "$file")
    file_name_without_extension="${file_name%.*}"
    directory_name="$input_directory/$file_name_without_extension"
    
    # Check if a file with the same name as the directory already exists
    if [ -e "$directory_name" ]; then
        # Temporarily rename the file
        mv "$file" "$file.tmp"
        file="$file.tmp"
    fi
    
    # Create a directory with the same name as the file (excluding the file extension)
    mkdir -p "$directory_name"
    
    # Move the file into the newly created directory
    mv "$file" "$directory_name/$file_name"
    
    echo "Moved $file to $directory_name/"
done

echo "Done!"
