#!/bin/bash

# Define the source and target directories
SOURCE_DIR="$HOME/.dotfiles/configs"
TARGET_DIR="$HOME"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: $SOURCE_DIR does not exist."
    exit 1
fi

echo "Linking dotfiles from $SOURCE_DIR to $TARGET_DIR..."

# Iterate through all files in the source directory (including hidden ones)
# We use 'dotglob' to ensure we catch files starting with a period
shopt -s dotglob

for filepath in "$SOURCE_DIR"/*; do
    # Get the filename only
    filename=$(basename "$filepath")

    # Define the full path for the destination
    target_path="$TARGET_DIR/$filename"

    # Skip directories if you only want to link files (optional)
    # if [ -d "$filepath" ]; then
    #    continue
    # fi

    # Remove existing file, symlink, or directory at the target location
    # This ensures the 'replace' requirement is met
    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
        rm -rf "$target_path"
    fi

    # Create the symbolic link
    ln -s "$filepath" "$target_path"
    echo "Linked: $filename"
done

shopt -u dotglob

echo "Done! Your home directory is now synced with your dotfiles."
