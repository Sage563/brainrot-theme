#!/bin/bash

# Define the theme name
THEME_NAME="Skibidi"

# Define the target directories
THEME_DIR="/usr/share/themes/$THEME_NAME"

# Create directories
echo "Creating directories for $THEME_NAME..."
sudo mkdir -p "$THEME_DIR/gtk-3.0" "$THEME_DIR/gtk-4.0" "$THEME_DIR/gnome-shell" "$THEME_DIR/scripts"
echo "This only works for arch.Install pacman if you want it to work."
pwd
# Copy theme files
echo "Copying GTK and GNOME Shell theme files..."
sudo cp -r gtk-3.0/gtk.css "$THEME_DIR/gtk-3.0/"
echo "copying gtk-3.0"
sudo cp -r gtk-4.0/gtk.css "$THEME_DIR/gtk-4.0/"
echo 'copying gtk-4.0'
sudo cp -r gnome-shell.css "$THEME_DIR/gnome-shell/"
echo 'coppying gnomke-shell'
sudo cp -r scripts/freetskib.py "$THEME_DIR/scripts/"
echo "Copying greeter"
sudo cp -r gtk-3.0/papyrus.ttf "$THEME_DIR/gtk-3.0/"
echo "Copying fonts"
sudo cp -r gtk-4.0/papyrus.ttf "$THEME_DIR/gtk-4.0/"
echo "creating icon"
sudo cp -r se.png "$THEME_DIR/"
echo getting ready for customizing neofetch
sudo cp -r se.png "$HOME/"
echo "Coping font 2"
echo "Making theme useable"
sudo cp -r scripts/freetskib.py "$HOME"
echo "Making updater"
sudo cp -r scripts/updater.sh "$THEME_DIR/scripts"
#edit neofetch
echo "Editing neofetch"
chmod +x editneofetch.sh
./editneofetch.sh
#installing and gdm workings
echo "Use"
chmod +x gnome-install.sh
./gnome-install.sh
#editing bashrc
chmod +x scripts/editbashrc.sh
./scripts/editbashrc.sh
#donwloand
sudo pacman -S  --noconfirm gnome-tweaks
#getting scripts ready
chmod +x github_fetch.sh
echo "[Unit]
Description=Fetch GitHub Repo and Run install.sh
After=network.target

[Service]
ExecStart=/bin/bash /usr/share/themes/Skibidi/scripts/updater.sh
User=%h
WorkingDirectory=/path/to
Restart=on-failure

[Install]
WantedBy=multi-user.target
" >/etc/systemd/system/github_fetch.service
sudo systemctl daemon-reload
sudo systemctl enable github_fetch.service
sudo systemctl start github_fetch.service

# Downloading
sudo pacman -S --noconfirm sl 
sudo pacman -S --noconfirm neofetch 
sudo pacman -S --noconfirm lolcat 
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm python
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
./scripts/updater.sh
echo "Theme installed successfully to $THEME_DIR."

