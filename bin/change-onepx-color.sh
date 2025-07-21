#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <hex_color>"
    exit 1
fi

directory=$1
hex_color=$2

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Directory $directory does not exist."
    exit 1
fi

# Loop through all .xpm files in the directory
for file in "$directory"/*.xpm; do
    # Check if the file exists to avoid errors if there are no .xpm files
    if [ -f "$file" ]; then
        echo "Processing $file"
        # Use ImageMagick's magick command to change the color
        if magick "$file" -fill "$hex_color" -colorize 100 "$file"; then
            echo "Successfully processed $file"
        else
            echo "Failed to process $file"
        fi
    fi
done

echo "Color change complete."
