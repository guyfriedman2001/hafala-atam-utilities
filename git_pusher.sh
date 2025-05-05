#!/bin/bash

#step 0 - verify that we are in an actuall git repo
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not inside a Git repository."
    sleep 3
    exit 1
fi

# Step 1: Show files in current directory
echo "Select files to add:"
ls -p | grep -v /  # list only files, not directories

# Step 2: Prompt for files to add
read -p "Files to add (default: .): " files_to_add
files_to_add=${files_to_add:-.}

# Step 3: Show what will be added
echo "Running: git add $files_to_add"
git add $files_to_add

# Step 4: Prompt for commit message
read -p "Commit message (default: new commit): " commit_msg
commit_msg=${commit_msg:-new commit}

# Step 5: Commit
echo "Running: git commit -m \"$commit_msg\""
git commit -m "$commit_msg"

# Step 6: Ask to push
read -p "Push '$files_to_add'? [Y/n]: " push_confirm
push_confirm=${push_confirm:-Y}

# Step 7: Push if confirmed
if [[ "$push_confirm" =~ ^[Yy]$ ]]; then
    echo "Running: git push"
    git push
else
    echo "Skipped push."
fi

sleep 3
