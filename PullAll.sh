#!/bin/bash
# Change to the parent directory
cd ../

# Iterate over subdirectories and perform git pull
for folder in */; do
    echo "Updating $folder"
    cd "$folder"
    git pull
    cd ..
    echo "==================="
done
