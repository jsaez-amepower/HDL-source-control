#!/bin/bash

# Get list of all branches
branches=$(git branch -r | grep -v '\->' | sed 's/origin\///g')

# Loop through each branch
for branch in $branches
do
  # Create a new worktree for each branch
  git worktree add ../$branch $branch
done