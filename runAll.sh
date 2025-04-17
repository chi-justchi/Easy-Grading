#!/bin/bash

# Create output folder
mkdir -p output

# Find all FileSystem.cpp files and work from their directories
find . -type f -name "FileSystem.cpp" | while read fs_path; do
    # Get the directory containing the cpp file
    student_dir=$(dirname "$fs_path")

    echo "Processing $student_dir"

    # Go into the directory containing the .cpp files
    cd "$student_dir" || { echo "❌ Failed to enter $student_dir"; continue; }

    # Compile all .cpp files in this directory only
    if g++ -std=c++20 *.cpp -o program.out 2> compile_error.txt; then
        echo "✅ Compiled with g++ in $student_dir"

        # Run the program and capture output
        if ./program.out > temp_output.txt 2>&1; then
            echo "✅ Execution successful"
        else
            echo "⚠️ Execution failed"
        fi
    else
        echo "❌ Compilation failed"
        cat compile_error.txt
        cp compile_error.txt temp_output.txt
    fi

    # Go back to root before copying
    cd - > /dev/null

    # Extract a student identifier from the path (e.g., folder name at depth 2)
    student_id=$(echo "$student_dir" | cut -d'/' -f2)
    cp "$student_dir/temp_output.txt" "output/${student_id}_output.txt" || echo "❌ cp failed for $student_dir"

    echo ""
done
