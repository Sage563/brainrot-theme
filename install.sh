#!/bin/bash




$check = $(python3 scripts/VU5JVEVELmpvc24gREVDT0RFUg==.py)
if [ "$check" == "TRUE" ]; then

    echo alredy installed 
    exit 1
elif [ "$check" == "false" ]; then
    :
fi


THEME_NAME="Skibidi"

# Define the target directories
THEME_DIR="./usr/share/themes/$THEME_NAME"

# Create directories
echo "Creating directories for $THEME_NAME..."
sudo mkdir -p "$THEME_DIR/gtk-3.0" "$THEME_DIR/gtk-4.0" "$THEME_DIR/gnome-shell" "$THEME_DIR/scripts "/tmp/updater/"" "$THEME_DIR/cchangle"
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
sudo cp -r scripts/battery_checker.py "$THEME_DIR/scripts"
sudo cp -r scripts/playsound.py "$THEME_DIR/scripts"
sudo cp -r scripts/fannum_battery.py "$THEME_DIR/scripts"
sudo cp -r fannum_battery.wav "$HOME"
sudo cp -r github_fetch.serice "/etc/systemd/system/github_fetch.serice " 
sudo cp -r fannumbattery.service "/etc/systemd/system/fannumbattery.service" 
sudo cp -r 3hourfat.service "/etc/systemd/system/3hourfat.service"
sudo cp -r touch_grass.wav "$THEME_DIR/scripts"
sudo cp -r scripts/3hourgroundsound.py "$THEME_DIR/scripts"
sudo cp -r onlogin.service "/etc/systemd/system/onlogin.service"
sudo cp -r scripts/sreachserach.py "$THEME_DIR/scripts"
sudo cp -r cchangle/UNITED.json "$THEME_DIR/cchangle/UNITED.json"

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
#getting ready

echo "Getting ready"
sleep(10)



#modules
pip install selenium
pip install pygame




sudo systemctl daemon-reload
sudo systemctl enable /etc/systemd/system/github_fetch.service
sudo systemctl start /etc/systemd/system/github_fetch.service


sudo systemctl daemon-reload
sudo systemctl enable /etc/systemd/system/fannumbattery.service
sudo systemctl start /etc/systemd/system/fannumbattery.service


sudo systemctl daemon-reload
sudo systemctl enable /etc/systemd/system/3hourfat.service
sudo systemctl start /etc/systemd/system/3hourfat.service


sudo systemctl daemon-reload
sudo systemctl enable /etc/systemd/system/onlogin.service
sudo systemctl start /etc/systemd/system/onlogin.service


# Downloading

#checker
$working =$(pwd)
distro=$(python3 scripts/get_distro.py)
echo "$"
if ['$distro' == "Arch"];then
    sudo pacman -S --noconfirm sl 
    sudo pacman -S --noconfirm neofetch 
    sudo pacman -S --noconfirm lolcat 
    sudo pacman -S --noconfirm git
    sudo pacman -S --noconfirm python
    sudo pacman -S --noconfirm w3m
    sudo pacman -S --noconfirm python-pip
    sudo pacman -S --noconfirm kitty
fi
if ['$distro' == "Ubuntu"];then
    sudo apt install --y sl 
    sudo apt install --y neofetch 
    sudo apt install --y lolcat 
    sudo apt install --y git
    sudo apt install --y python3
    sudo apt install --y w3m
    sudo apt install python3-pip -y
    sduo apt install --y kitty
fi
if ['$distro' == "Debian"];then
    sudo apt install --y sl 
    sudo apt install --y neofetch 
    sudo apt install --y lolcat 
    sudo apt install --y git
    sudo apt install --y python3
    sudo apt install --y w3m
    sudo apt install python3-pip -y
    sudo apt install  --y kitty
fi
if ['$distro' == "OpenSUSE"];then
    sudo zyper install --y sl 
    sudo zyper install --y neofetch 
    sudo zyper install --y lolcat 
    sudo zyper install --y git
    sudo zyper install --y python3
    sudo zyper install --y w3m
    python -m ensurepip
fi
    sudo zyper install --y kitty
if ['$distro' == "Fedora"];then
    sudo dnf install --y sl 
    sudo dnf install --y neofetch 
    sudo dnf install --y lolcat 
    sudo dnf install --y git
    sudo dnf install --y python3
    sudo dnf install --y w3m
    sudo dnf install python3-pip
    sudo dnf install --y kitty
fi
if ['$distro' == "RHEL"];then
    printf "Sorry no support                                 :(\n"
    echo "If you think this is wrong check https://www.gnome.org/getting-gnome/ you need gnome to run and you can't get gnome on RHEL"
    echo "If you Im wrong put an issue on the github page:https://github.com/Sage563/brainrot-theme/issues"
    exit
fi
# Set permissions
sudo mv config.conf 

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

