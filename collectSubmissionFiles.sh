#!/bin/bash

# Create the destination folder if it doesn't exist
dest_folder="collected_cpp_files"
mkdir -p "$dest_folder"

# Loop through all folders matching the format (lastnamefirstname_something_something_)
for dir in */; do
    # Only process folders that match the general pattern
    if [[ "$dir" == *_*_*_*/ ]]; then
        # Remove trailing slash
        base_name="${dir%/}"

        # Get the part before the first underscore
        name_part="${base_name%%_*}"

        # Look for FileSystem.cpp in this folder or its subfolders
        file_path=$(find "$dir" -type f -name "FileSystem.cpp" | head -n 1)

        if [ -n "$file_path" ]; then
            cp "$file_path" "$dest_folder/${name_part}_FileSystem.cpp"
            echo "Copied: $file_path -> $dest_folder/${name_part}_FileSystem.cpp"
        else
            echo "No FileSystem.cpp found in $dir"
        fi
    fi
done
