#!/bin/bash

# Set Folder_A and Folder_B path
#Folder_A is a list with all the HDL and tb
#Folder_B is where the repository is
Folder_A="path1"
Folder_B="path2"

# Go to Folder_B
cd "$Folder_B"

# For each unique .v and .vhd file in Folder_A
for file in $(ls "$Folder_A"/*.v "$Folder_A"/*.vhd | xargs -n 1 basename | sort -u); do
    # 1. Checkout main branch
    git checkout main

    # 3. Remove extension from the filename
    var_filename="${file%.*}"

    # 5. Create a new branch from main named var_filename
    git checkout -b "$var_filename"

    # 6. Move all files with the same name (but any extension) from Folder_A to Folder_B
    find "$Folder_A" -type f -name "${var_filename}.*" -exec mv {} "$Folder_B" \;

    # 7. Create a new variable var_tbfilename
    var_tbfilename="${var_filename}_tb"

    # 8. If a file exists with the same name as var_tbfilename (but any extension), move it from Folder_A to Folder_B
    if ls "$Folder_A"/"$var_tbfilename".* 1> /dev/null 2>&1; then
        find "$Folder_A" -type f -name "${var_tbfilename}.*" -exec mv {} "$Folder_B" \;
    fi

    # 9. Git add
    git add .

    # 10. Git commit
    git commit -m "m"

    # 11. Git push --force
    git push origin "$var_filename" --force
done

# 12. Go back to main branch
git checkout main
