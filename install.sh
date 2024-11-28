#!/bin/bash

# Define the theme name
THEME_NAME="Skibidi"

# Define the target directories
THEME_DIR="/usr/share/themes/$THEME_NAME"

# Create directories
echo "Creating directories for $THEME_NAME..."
sudo mkdir -p "$THEME_DIR/gtk-3.0" "$THEME_DIR/gtk-4.0" "$THEME_DIR/gnome-shell" "$THEME_DIR/scripts"
echo "This only works for arch.Install pacman if you want it to work."
# Copy theme files
echo "Copying GTK and GNOME Shell theme files..."
sudo cp -r gtk-3.0/gtk.css "$THEME_DIR/gtk-3.0/"
sudo cp -r gtk-4.0/gtk.css "$THEME_DIR/gtk-4.0/"
sudo cp -r gnome-shell.css "$THEME_DIR/gnome-shell/"
sudo cp -r scripts/freetskib.py "$THEME_DIR/scripts/"


#donwloand
sudo pacman -S gnome-tweaks
# Install required packages
packages=("sl" "neofetch" "lolcat" "git")

for pkg in "${packages[@]}"; do
    if ! pacman -Q $pkg &>/dev/null; then
        echo "$pkg not found, installing..."
        sudo pacman -S --noconfirm $pkg
    else
        echo "$pkg is already installed."
    fi
done

# Set permissions
echo "Setting permissions..."
sudo chmod -R 755 "$THEME_DIR"

# Run the customization Python script if it exists
if [ -f "$THEME_DIR/scripts/customize.py" ]; then
    echo "Running customization script..."
    sudo python3 "$THEME_DIR/scripts/customize.py"
else
    echo "Customization script not found!"
fi

echo "Theme installed successfully to $THEME_DIR."
