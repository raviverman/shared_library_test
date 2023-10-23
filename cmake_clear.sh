#!/usr/bin/env bash

# Define the project directory
project_dir="."

# List of file extensions and patterns to remove
files_to_remove=(
    "CMakeCache.txt"
    "CMakeFiles"
    "CMakeScripts"
    "CMakeTmp"
    "Makefile"
    "*.cmake"
)

# Change to the project directory
cd "$project_dir" || exit

# Remove files and directories matching the patterns
for pattern in "${files_to_remove[@]}"; do
    find . -name "$pattern" -exec rm -r {} +
done

echo "CMake-generated files and build artifacts have been removed."