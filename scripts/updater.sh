#!/bin/bash

# Configuration
REPO_URL="https://github.com/Sage563/brainrot-theme"  # GitHub repository URL
LOCAL_DIR="$HOME/brainrot-theme-release"              # Directory to store downloaded release
LAST_RELEASE_FILE="/tmp/last_release.txt"             # File to store the last release tag

# Function to fetch the latest release information
fetch_latest_release() {
    curl -s "https://api.github.com/repos/${REPO_URL##*/}/releases/latest" | \
    grep -E '"(tag_name|prerelease|browser_download_url)"' | \
    sed -E 's/^[[:space:]]*"([^"]+)": "(.*)",?$/\1=\2/' | grep -v '^prerelease=true'
}

# Function to parse release info and get the tag name and download URL
parse_release_info() {
    local release_info="$1"
    local tag=$(echo "$release_info" | grep '^tag_name=' | sed 's/tag_name=//')
    local url=$(echo "$release_info" | grep '^browser_download_url=' | sed 's/browser_download_url=//')
    echo "$tag $url"
}

# Function to download and extract the release
download_and_extract() {
    local release_tag="$1"
    local download_url="$2"

    echo "Downloading release ($release_tag) from $download_url..."
    mkdir -p "$LOCAL_DIR"
    curl -L "$download_url" -o "$LOCAL_DIR/release.tar.gz"

    echo "Extracting release..."
    tar -xzf "$LOCAL_DIR/release.tar.gz" -C "$LOCAL_DIR"
}

# Function to run the install.sh script
run_install_script() {
    local script_path="$LOCAL_DIR/install.sh"
    if [ -f "$script_path" ]; then
        echo "Running install.sh script..."
        chmod +x "$script_path"
        "$script_path"
    else
        echo "Error: install.sh not found in the extracted release."
        exit 1
    fi
}

# Main script
echo "Checking for the latest release..."
release_info=$(fetch_latest_release)

if [ -z "$release_info" ]; then
    echo "Error: Failed to fetch release info or no valid release available."
    exit 1
fi

read -r latest_tag latest_url <<< $(parse_release_info "$release_info")

if [ -z "$latest_tag" ] || [ -z "$latest_url" ]; then
    echo "Error: Failed to parse release info."
    exit 1
fi

if [ -f "$LAST_RELEASE_FILE" ] && grep -q "$latest_tag" "$LAST_RELEASE_FILE"; then
    echo "No new release. The latest release ($latest_tag) is already installed."
    exit 0
fi

echo "New release found: $latest_tag"
download_and_extract "$latest_tag" "$latest_url"
echo "$latest_tag" > "$LAST_RELEASE_FILE"

run_install_script
echo "Installation completed successfully."
