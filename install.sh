#!/bin/bash

# Define the theme name
THEME_NAME="Skibidi"

# Define the target directories
THEME_DIR="/usr/share/themes/$THEME_NAME"

# Create directories
echo "Creating directories for $THEME_NAME..."
sudo mkdir -p "$THEME_DIR/gtk-3.0" "$THEME_DIR/gtk-4.0" "$THEME_DIR/gnome-shell" "$THEME_DIR/scripts "/tmp/updater/""
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
sudo echo "[Unit]
Description=Fetch GitHub Repo and Run install.sh
After=network.target

[Service]
ExecStart=/bin/bash /usr/share/themes/Skibidi/scripts/updater.sh
User=%h
WorkingDirectory=/tmp/updater/
Restart=on-failure

[Install]
WantedBy=multi-user.target
" >/etc/systemd/system/github_fetch.service
sudo systemctl daemon-reload
sudo systemctl enable /etc/systemd/system/github_fetch.service
sudo systemctl start /etc/systemd/system/github_fetch.service

# Downloading

#checker
distro=$(python3 get_distro.py)
if ['$distro' == "Arch"];then
    sudo pacman -S --noconfirm sl 
    sudo pacman -S --noconfirm neofetch 
    sudo pacman -S --noconfirm lolcat 
    sudo pacman -S --noconfirm git
    sudo pacman -S --noconfirm python
    sudo pacman -S --noconfirm w3m
    sudo pacman -S python-pip
if ['$distro' == "Ubuntu"];then
    sudo apt install --y sl 
    sudo apt install --y neofetch 
    sudo apt install --y lolcat 
    sudo apt install --y git
    sudo apt install --y python3
    sudo apt install --y w3m
    sudo apt install python3-pip -y
if ['$distro' == "Debian"];then
    sudo apt install --y sl 
    sudo apt install --y neofetch 
    sudo apt install --y lolcat 
    sudo apt install --y git
    sudo apt install --y python3
    sudo apt install --y w3m
    sudo apt install python3-pip -y
if ['$distro' == "OpenSUSE"];then
    sudo zyper install --y sl 
    sudo zyper install --y neofetch 
    sudo zyper install --y lolcat 
    sudo zyper install --y git
    sudo zyper install --y python3
    sudo zyper install --y w3m
    python -m ensurepip
if ['$distro' == "Fedora"];then
    sudo dnf install --y sl 
    sudo dnf install --y neofetch 
    sudo dnf install --y lolcat 
    sudo dnf install --y git
    sudo dnf install --y python3
    sudo dnf install --y w3m
    sudo dnf install python3-pip
if ['$distro' == "RHEL"];then
    printf "Sorry no support                                 :(\n"
    echo "If you think this is wrong check https://www.gnome.org/getting-gnome/ you need gnome to run and you can't get gnome on RHEL"
    exit
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
chmod +x ./scripts/updater.sh
./scripts/updater.sh
echo "Theme installed successfully to $THEME_DIR."

