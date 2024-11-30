#!/bin/bash

# Configuration
REPO_URL="https://github.com/Sage563/brainrot-theme.git"  # Replace with your GitHub repository URL
LOCAL_DIR="$HOME"             # Replace with your desired local directory
LAST_COMMIT_FILE="/tmp/last_commit.txt"      # File to store the last fetched commit hash

# Function to fetch the latest commit hash
fetch_latest_commit_hash() {
    git ls-remote "$REPO_URL" HEAD | awk '{print $1}'
}

# Function to check if the repository is up to date
check_for_update() {
    local latest_commit
    latest_commit=$(fetch_latest_commit_hash)

    if [ -f "$LAST_COMMIT_FILE" ]; then
        local last_commit
        last_commit=$(cat "$LAST_COMMIT_FILE")

        if [ "$latest_commit" == "$last_commit" ]; then
            echo "No new commits. Repository is up to date."
            return 1
        fi
    fi

    echo "$latest_commit" > "$LAST_COMMIT_FILE"
    return 0
}

# Function to update the repository
update_repository() {
    if [ ! -d "$LOCAL_DIR/.git" ]; then
        echo "Cloning the repository for the first time..."
        git clone "$REPO_URL" "$LOCAL_DIR"
    else
        echo "Fetching the latest changes..."
        git -C "$LOCAL_DIR" pull
    fi
}

# Function to run the install.sh script
run_install_script() {
    local script_path="$LOCAL_DIR/install.sh"
    if [ -f "$script_path" ]; then
        echo "Running install.sh script..."
        chmod +x "$script_path"
        "$script_path"
    else
        echo "install.sh not found."
        exit 1
    fi
}

# Main script
if check_for_update; then
    update_repository
    run_install_script
fi
