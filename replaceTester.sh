#!/bin/bash

# Path to the master tester file
master_tester="GeneralFileSystemTester.cpp"

# Make sure the master tester file exists
if [ ! -f "$master_tester" ]; then
    echo "Error: $master_tester not found in current directory."
    exit 1
fi

# Loop through each student folder
for dir in */; do
    # Skip the master tester file directory if accidentally placed inside a folder
    if [ "$dir" == "collected_cpp_files/" ]; then
        continue
    fi

    # Find and replace all FileSystemTester.cpp in student directories
    find "$dir" -type f -name "FileSystemTester.cpp" | while read tester_path; do
        cp "$master_tester" "$tester_path"
        echo "Replaced: $tester_path"
    done
done
