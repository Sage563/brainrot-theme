#!/bin/bash

# Script to apply a custom GNOME theme to GDM
# Replace "brainrot-theme" with your theme name
THEME_NAME="Skibidi"
ICON_THEME="/usr/share/themes/se.png" # Replace with your icon theme if applicable

# Ensure the script is run with sudo
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

# Check if the theme exists in /usr/share/themes
if [ ! -d "/usr/share/themes/$THEME_NAME" ]; then
  echo "Theme '$THEME_NAME' not found in /usr/share/themes."
  echo "Please copy your theme to /usr/share/themes/ and try again."
  exit 1
fi

# Create GDM configuration directory if it doesn't exist
if [ ! -d "/etc/dconf/db/gdm.d" ]; then
  echo "Creating /etc/dconf/db/gdm.d directory..."
  mkdir -p /etc/dconf/db/gdm.d
fi

# Write the custom settings to GDM's configuration
echo "Applying the theme to GDM..."
cat <<EOL > /etc/dconf/db/gdm.d/00-custom-settings
[org/gnome/desktop/interface]
gtk-theme='$THEME_NAME'
icon-theme='$ICON_THEME'
EOL

# Update dconf database
echo "Updating dconf database..."
dconf update

# Set proper permissions for the theme directory
echo "Ensuring proper permissions for the theme..."
chmod -R a+r /usr/share/themes/"$THEME_NAME"

# Restart GDM to apply changes
echo "Restarting GDM to apply changes..."
systemctl restart gdm

echo "Theme '$THEME_NAME' has been applied to GDM."
echo "If you encounter any issues, you can revert changes by editing /etc/dconf/db/gdm.d/00-custom-settings."

