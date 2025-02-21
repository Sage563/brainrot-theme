#!/bin/bash

check=$(python3 scripts/VU5JVEVELmpvc24gREVDT0RFUg.py)
if [ "$check" = "TRUE" ]; then
    echo "Already installed"
    exit 1
elif [ "$check" = "false" ]; then
    echo "Proceeding with installation..."
fi

THEME_NAME="Skibidi"
THEME_DIR="/usr/share/themes/$THEME_NAME"

# Create directories
echo "Creating directories for $THEME_NAME..."
sudo mkdir -p "$THEME_DIR/gtk-3.0" "$THEME_DIR/gtk-4.0" "$THEME_DIR/gnome-shell" "$THEME_DIR/scripts" "$THEME_DIR/cchangle"

# Copy theme files
echo "Copying theme files..."\
echo "Copying GTK 3.0 and GTK 4.0 files"
sudo cp -r gtk-3.0/gtk.css "$THEME_DIR/gtk-3.0/"
sudo cp -r gtk-4.0/gtk.css "$THEME_DIR/gtk-4.0/"
sudo cp -r gnome-shell.css "$THEME_DIR/gnome-shell/"
sudo cp -r scripts/freetskib.py "$THEME_DIR/scripts/"
sudo cp -r gtk-3.0/papyrus.ttf "$THEME_DIR/gtk-3.0/"
sudo cp -r gtk-4.0/papyrus.ttf "$THEME_DIR/gtk-4.0/"
sudo cp -r se.png "$THEME_DIR/"
sudo cp -r se.png "$HOME/"
sudo cp -r scripts/updater.sh "$THEME_DIR/scripts/"
sudo cp -r scripts/battery_checker.py "$THEME_DIR/scripts/"
sudo cp -r scripts/playsounde.py "$THEME_DIR/scripts/"
sudo cp -r scripts/fannum_battery.py "$THEME_DIR/scripts/"
sudo cp -r fannum_battery.wav "$HOME"
sudo cp -r github_fetch.service "/etc/systemd/system/"
sudo cp -r fannumbattery.service "/etc/systemd/system/"
sudo cp -r 3hourfat.service "/etc/systemd/system/"
sudo cp -r touch_grass.wav "$THEME_DIR/"
sudo cp -r scripts/3hourgroundsound.py "$THEME_DIR/scripts/"
sudo cp -r onlogin.service "/etc/systemd/system/"
sudo cp -r scripts/sreachserach.py "$THEME_DIR/scripts/"
sudo cp -r cchangle/VU5JVEVE.json "$THEME_DIR/cchangle/"

# Detect Linux distribution
distro=$(python3 scripts/get_distro.py)
echo "Detected distro: $distro"

if [ "$distro" = "Arch" ]; then
    sudo pacman -S --noconfirm sl neofetch lolcat git python w3m python-pip kitty
elif [ "$distro" = "Ubuntu" ] || [ "$distro" = "Debian" ]; then
    sudo apt install -y sl neofetch lolcat git python3 w3m python3-pip kitty
elif [ "$distro" = "OpenSUSE" ]; then
    sudo zypper install -y sl neofetch lolcat git python3 w3m python3-pip kitty
elif [ "$distro" = "Fedora" ]; then
    sudo dnf install -y sl neofetch lolcat git python3 w3m python3-pip kitty
elif [ "$distro" = "RHEL" ]; then
    printf "Sorry no support                                 :(\n"
    echo "If you think this is wrong check https://www.gnome.org/getting-gnome/ you need gnome to run and you can't get gnome on RHEL"
    echo "If you Im wrong put an issue on the github page:https://github.com/Sage563/brainrot-theme/issues"
fi

# Edit neofetch
echo "Editing neofetch..."
chmod +x editneofetch.sh
./editneofetch.sh

# Install and configure GNOME
echo "Installing GNOME..."
chmod +x gnome-install.sh
./gnome-install.sh

# Editing .bashrc
chmod +x scripts/editbashrc.sh
./scripts/editbashrc.sh

# Install GNOME Tweaks (for Arch)
if [ "$distro" = "Arch" ]; then
    sudo pacman -S --noconfirm gnome-tweaks
fi

echo "Getting ready..."
sleep 10

# Install required Python modules
pip install selenium pygame

# Reload and enable services
sudo systemctl daemon-reload
sudo systemctl enable github_fetch.service fannumbattery.service 3hourfat.service onlogin.service
sudo systemctl start github_fetch.service fannumbattery.service 3hourfat.service onlogin.service

# Set permissions
echo "Setting permissions..."
sudo chmod -R 755 "$THEME_DIR"

# Run the customization script
if [ -f "$THEME_DIR/scripts/customize.py" ]; then
    echo "Running customization script..."
    sudo python3 "$THEME_DIR/scripts/customize.py"
else
    echo "Customization script not found!"
fi

chmod +x scripts/updater.sh
./scripts/updater.sh

echo "Theme installed successfully to $THEME_DIR."
