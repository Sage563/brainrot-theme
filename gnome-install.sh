distro=$(python3 scripts/get_distro.py)

if [ "$distro" == "Arch" ]; then
    echo "Type 4 for the first prompt"
    printf "4\n" | sudo pacman -S --noconfirm xorg xorg-server
    sudo pacman -S --noconfirm gdm
    printf "all" | sudo pacman -S --noconfirm gnome
else
    python3 scripts/install_gnome.py
fi
