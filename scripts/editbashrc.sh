#!/bin/bash

# Path to .bashrc
BASHRC_FILE="$HOME/.bashrc"

# Path to the file containing the new content
NEW_CONTENT_FILE="bashrcne.sh"

# Check if the new content file exists
if [ ! -f "$NEW_CONTENT_FILE" ]; then
    echo "Error: File '$NEW_CONTENT_FILE' does not exist."
    exit 1
fi

# Backup the existing .bashrc
cp "$BASHRC_FILE" "${BASHRC_FILE}.bak"
echo "Backup of .bashrc created at ${BASHRC_FILE}.bak"

# Replace .bashrc with the content of the new file
cp "$NEW_CONTENT_FILE" "$BASHRC_FILE"
echo ".bashrc updated with content from '$NEW_CONTENT_FILE'."

# Reload .bashrc to apply changes
source "$BASHRC_FILE"
echo ".bashrc changes applied."