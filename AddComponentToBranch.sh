#!/bin/bash

# Set Folder_A and Folder_B path
#Folder_A is a list with all the HDL and tb
#Folder_B is where the repository is
Folder_A="path1"
Folder_B="path2"

# Go to Folder_B
cd "$Folder_B"

# For each unique folder in Folder_A
for dir in $(ls "$Folder_A") ; do
	
	echo "$dir"
    # 1. Checkout main branch
    git checkout main

    # 5. Create a new branch from main named var_filename
    git checkout -b "$dir"

    # 6. Move all files in Folder_A to Folder_B
    cp -v "$Folder_A"/"$dir"/* "$Folder_B"

    # 9. Git add
    git add .

    # 10. Git commit
    git commit -m "m"

    # 11. Git push --force
    git push origin "$dir" --force
done

# 12. Go back to main branch
git checkout main
